### Creating a docker containor 
FROM node:14
# make sure node_14 is intalled in containor
WORKDIR /app
# create a folder app , and all the RUN commands will be executed in this working directory
COPY package.json .  
# into the working_directoru copy package.json file
# also done individually for efficiency 
RUN npm install
## run npm install , this will work since node is isntalled
COPY . .
## copy rest of the files from the director
EXPOSE 3000
# open a port 3000 to local, 
CMD ["node","app.mjs"]
# run the cmd : node app.mjs , which will launch the applications

### Creating a python containor
FROM python:3.8  
# version of python
WORKDIR /app
COPY requirements.txt requirements.txt 
## copy requirements into requirements , usually this will hold information of all the require packages.
RUN pip3 install -r requirements.txt 
## install all the libraries from the requirements file.
COPY ..
## copy rest of the code.
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
## basic python command to run the file at host = 0.0.0.0 . CMD commands are always run after the containor is finalized
