import subprocess
import time
import os
import random

with open(os.path.join(os.path.dirname(__file__), "wlan_whitelist"), "r") as f:
    wlan_whitelist = f.read().splitlines()

powered_wait = 10
discharge_wait = 300
wallpaper_folder = "/home/ashleyx/Pictures/Wallpapers/Good"
wallpaper_choices = os.listdir(wallpaper_folder)
video_folder = "/home/ashleyx/Pictures/Wallpapers/videos"
anime_folder = "/home/ashleyx/Pictures/animematrix_gifs/"

anime_choices = {
    "known": [
        f"asusctl anime gif -p {anime_folder}Sound\ wave.gif -a 0.7 -x 3 -s 1.1 -l 0 -b 0.6",
        f"asusctl anime gif -p {anime_folder}Hands.gif -a 0.7 -x 3 -s 2 -l 0",
        f"asusctl anime gif -p {anime_folder}4958197.gif -l 0 -a 0.5 -s 1.8",
        f"asusctl anime gif -p {anime_folder}pikachu_running_mirrored.gif  -l 0 -a 0.628 -s 0.7 -b 0.5",
    ],
    "unknown": [
        f"asusctl anime gif -p {anime_folder}The_eye.gif -b 0.3 -s 1.3 -l 0",
        f"asusctl anime gif -p {anime_folder}SenketsuLoop.gif -l 0 -a 0.8 -x 4 -s 1.3 -b 0.5",
    ],
    "clear": f"asusctl anime gif -p {anime_folder}pikachu_running_mirrored.gif -s 0 -b 0",
}

external_uuid = "c6c79117-4bdf-4cd8-8dfb-3682a8cf0227"


class Butler:

    wait_time = None
    anime_state = None  # True if in whitelist
    wallpaper_state = None  # True is video wallpaper
    status = None  # True if charging
    proc = None  # wallpaper process
    anime_proc = None  # aime matrix process
    ext_mounted = False
    ext_connected = False

    def external_disk_manager(self):
        now_ext_mounted = os.path.ismount("/mnt/externaldrive")
        mounted_disks = subprocess.check_output(["lsblk -ln -o uuid"], shell=True).decode().split()
        now_ext_connected = external_uuid in mounted_disks
        if now_ext_mounted and now_ext_connected:
            self.ext_mounted = self.ext_connected = True
        elif not (self.ext_mounted or self.ext_connected):
            if now_ext_connected:
                subprocess.run("sudo systemctl restart mnt-externaldrive.mount")
        elif self.ext_mounted and not now_ext_connected:
            self.ext_mounted = self.ext_connected = False

    def check_if_charging(self):
        with open("/sys/class/power_supply/BAT0/status", "r") as f:
            status = f.read().strip()
        if status == "Discharging":
            self.wait_time = discharge_wait
            return False
        else:
            self.wait_time = powered_wait
            return True

    def power_profile_manager(self):
        if self.status:
            subprocess.run(["asusctl", "profile", "-P", "Performance"])
        else:
            subprocess.run(args=["asusctl", "profile", "-P", "Quiet"])

    def anime_manager(self):
        if self.status:
            connected = subprocess.check_output("iwctl station wlan0 show | grep State", shell=True)
            connected = connected.strip().decode().split(" ")[-1]
            if connected == "disconnected":
                network = None
            else:
                network = subprocess.check_output("iwctl station wlan0 show | grep network", shell=True)
                network = network.strip()[22:].decode()
            if network in wlan_whitelist or network is None:
                command = random.choice(anime_choices.get("known"))
            else:
                command = random.choice(anime_choices.get("unknown"))
            if self.anime_proc:
                self.anime_proc.terminate()
            self.anime_proc = subprocess.Popen([command], shell=True)
        else:
            if self.anime_proc:
                self.anime_proc.terminate()
                self.anime_proc = None
            subprocess.Popen([anime_choices.get("clear")], shell=True)

    def wallpaper_manager(self):
        self.status = False
        if self.status and not self.wallpaper_state:
            if self.proc:
                self.proc.terminate()
            self.proc = subprocess.Popen(
                [f"mpvpaper -vs '*' -o \"--loop-playlist shuffle --no-audio\" {video_folder}"],
                shell=True,
            )
            self.wallpaper_state = True
        elif not self.status:
            file_choice = os.path.join(wallpaper_folder, random.choice(wallpaper_choices))
            new_proc = subprocess.Popen([f"swaybg -i {file_choice} -m fit -c \#000000 "], shell=True)
            if self.proc:
                self.proc.terminate()
            self.proc = new_proc
            self.wallpaper_state = False
        self.status = self.check_if_charging()

    def keyboard_light(self):
        cmd = f"asusctl led-pow-2 keyboard {'-a' if self.status else '-S'}"
        subprocess.Popen([f"{cmd}"], shell=True)

    def update(self):
        self.status = self.check_if_charging()
        self.wallpaper_manager()
        self.anime_manager()
        self.keyboard_light()
        self.external_disk_manager()
        time.sleep(self.wait_time)


if __name__ == "__main__":
    butler = Butler()
    while True:
        butler.update()
