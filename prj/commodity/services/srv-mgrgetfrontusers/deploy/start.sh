./stop.sh
cp=./bin
for file in ./lib/*.jar
do
   cp=$cp:$file
done
nohup java -Djava.rmi.server.hostname=172.18.11.30 -Xms256m -Xmx512m -classpath $cp -Djava.security.policy=ServerShell.policy gnnt.MEBS.activeUserListener.ServerShell MgrGetFrontUsersServerShell >>./logs/sys.log & 
