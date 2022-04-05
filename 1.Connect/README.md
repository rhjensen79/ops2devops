# 1. Connect

### The purpose of this task, is to setup a working conection, to the demo enviroment. 

## Get ipadresses

- All Student ipadresses are shared from a Notion page, found [here](https://robert-jensen.notion.site/Ops2DevOps-c2706b737bb74fe9943367bc2156e7c4).
- Dont copy them, until the teacher has updated with the ipadessed, relavant for the current class. 
 

## Open in VSCode

- Start VScode
- Open "Command Palette" 

    `ctrl+Shift+P on Windows`

    `cmd+shift+P on Mac`

- Type `Remote SSH: Connect to Host`

- Select `Add new SSH Host`

- Type `ssh ubuntu@Ipadress`

- Open Command palette again, and type `Remote SSH: Connect to Host`

- Select the host you just added

    Accept certificate warning, if you get one. 

Your VSCode is now connected to the remote machie, and everything you do, will be done remote, and not local.