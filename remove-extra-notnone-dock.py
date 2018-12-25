import docker
import re
imagename = ''
client = docker.from_env()
for line in client.images.list():
     print("---------" , line)   #line va donner: <Image: 'narjess6/built-from-jenkins:latest'>
     my = str(line)
     splitline = my.strip().split()
     field1 = splitline[1]  # 'narjess6/built-from-jenkins:latest'>
     fi = re.sub('\'','',field1)  # narjess6/built-from-jenkins:latest> on enleve les '
     imagename = re.sub('>','',fi)     # narjess6/built-from-jenkins:latest
    # print("here is the name")
     print(imagename)
     if "narjess6/built-from-jenkins:latest" not in imagename:
        try:
           client.images.remove(imagename)
           print("removed image ===> ", imagename)
        except ValueError:
           print ("Oops! You cannot remove this docker image===> ", imagename)
