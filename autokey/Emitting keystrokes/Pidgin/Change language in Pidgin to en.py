import time

keyboard.send_keys("<alt>+l")
time.sleep(0.01)
for i in range(7):
    keyboard.send_keys("<down>")
keyboard.send_keys("<enter>")