from pydub import AudioSegment
from pydub.playback import play
from os.path import isfile, join
from pathlib import Path
from os import listdir
import random

filepath=str(Path.home())+"/Desktop/Sounds/"
onlyfiles = [f for f in listdir(filepath) if isfile(join(filepath, f))]

rand_item = random.choice(onlyfiles)
file=rand_item.split('.')[0]
extension=rand_item.split('.')[1]

print("Item to play = {}".format(rand_item))
print("file name = {}".format(file))
print("file extension = {}".format(extension))

sound = AudioSegment.from_file(filepath+rand_item, format=extension)
print("Random sound = {}".format(sound))
play(sound)