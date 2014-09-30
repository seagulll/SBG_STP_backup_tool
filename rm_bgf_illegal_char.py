import os


fileAName = '/home/elingyu/SBG/backup/backup_tool/BGF_show_'
fileA = file(fileAName, 'r')

fileBName = '/home/elingyu/SBG/backup/backup_tool/cc_tmp'
fileB = file(fileBName, 'w')


errorLen_1 = len('^[[K---(more)---^[[m^[[K')

errorLen_2 = len('^[[?1h^[=^[[KBuilding configuration...')


for tmpLine in fileA.readlines():
    newLine = ''
    if tmpLine.find('---(more)---') != -1:
        newLine = tmpLine[errorLen_1 - 3:]
    elif tmpLine.find('Building configuration') != -1:
        newLine = tmpLine[errorLen_2 - 28:]
    elif tmpLine.find('show configuration') != -1 or tmpLine.find('[local]BGF') != -1 :
        newLine = ''
    else :
        newLine = tmpLine
    
    fileB.write(newLine)


os.system('mv ' + fileBName + ' ' + fileAName )

