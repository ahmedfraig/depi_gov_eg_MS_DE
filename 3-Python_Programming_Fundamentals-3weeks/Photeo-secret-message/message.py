import shutil
import os
import re

#to clear destination folder
def clear_folder(folder_path):
    for filename in os.listdir(folder_path):
        file_path = os.path.join(folder_path, filename)
        try:
            if os.path.isfile(file_path) or os.path.islink(file_path):
                os.remove(file_path)
            elif os.path.isdir(file_path):
                shutil.rmtree(file_path)
        except Exception as e:
            print(f"Failed to delete {file_path}. Reason: {e}")
#-----------------------------------------------------------------------------

#to copy image from source folder to destination folder
def copy_rename_image(source,destination):
    source_folder = 'Alphabet'
    source_file = f'{source}.jpg'
    source_path = os.path.join(source_folder, source_file)
    
    destination_folder = 'result'
    destination_file = f'{destination}.jpg'
    destination_path = os.path.join(destination_folder, destination_file)
    shutil.copy2(source_path, destination_path)
#-----------------------------------------------------------------------------

alphabet_dict = {chr(i): str(index) for index , i in enumerate(range(ord('a'), ord('z')+1) , start= 1)}
alphabet_dict.update({ "." : "27" , " " : "28" })

#take input from user
pattern = re.compile(r'^[a-z .]*$')
name = input("Please, enter name contains only (alphabets & space & dot): ").lower()
while not bool(pattern.match(name)):
    name = input("Please, enter name contains only (alphabets & space & dot): ").lower()

destination_file_name = '0'
clear_folder('result')
for i in range(len(name)):
    copy_rename_image(alphabet_dict[name[i]],destination_file_name)
    temp = int(destination_file_name)+1
    destination_file_name = str(temp)