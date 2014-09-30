import os
fileAName = '/home/elingyu/SBG/backup/backup_tool/sbg-xt018_show_'
fileA = file(fileAName, 'r')

fileBName = '/home/elingyu/SBG/backup/backup_tool/cc_tmp'
fileB = file(fileBName, 'w')

errorLen = len('^[[7mPress <SPACE> to continue or <Q> to quit:^[[m^[[60;D^[[K')


for tmpLine in fileA.readlines():
    newLine = ''
    if tmpLine.find('Press <SPACE> to continue or <Q> to quit') != -1:
        newLine = tmpLine[errorLen - 4:]
    elif tmpLine.find('show configuration') != -1 or tmpLine.find('SBG-XT018.2 #') != -1 :
        newLine = ''
    else :
        newLine = tmpLine
    
    fileB.write(newLine)

os.system('mv ' + fileBName + ' ' + fileAName )
