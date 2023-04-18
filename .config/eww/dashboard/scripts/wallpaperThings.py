import os, subprocess

path =  "/home/matt/Pictures/wallpapers/"
def list_wallpaper(type):
    files_list = sorted(os.listdir(path))
    files = str(files_list)
    wallpaper = files.replace("'","")
    wallpaper = wallpaper.replace(" ", "")

    # 1 -> return list, else -> return string
    if type == 1:
        return files_list
    return wallpaper

def rename_wallpaper(choice):
    subprocess.run(['feh','--no-fehbg','--bg-fill',f"{path+choice}"])

    old_wallpaper = list_wallpaper(1)[0]
    if (choice != old_wallpaper):
        if (old_wallpaper[:2] == "a_"):
            os.rename(path+old_wallpaper, path+old_wallpaper[2:])

        new_wallpaper = path+"a_"+choice
        os.rename(path+choice, new_wallpaper)
