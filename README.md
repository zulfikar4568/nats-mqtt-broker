# NATS MQTT BROKER
© M. Zulfikar Isnaen, This is Under [MIT License](LICENSE).

# 1. Running on Windows
## Run the Service
Open the CMD or Powershell. Check the version of docker-compose and make sure installed
```bash
docker-compose --version
```
Run the docker-compose script
```bash
docker-compose -f docker-compose-windows.yml up --build -d
```

# 2. Running on Linux or Mac
## Running All Container
```bash
./up.sh
```

## Stoping All Container
```bash
./down.sh
```

## Allowing Script
Script must be have an access before executing
```
chmod 777 scripts/
```
## Start Publish Subscribe
Open 4 terminal, and run each command below

### Subscribe to MQTT topic on Terminal 1
This command will listen on topic `NATS/MQTT/Test/#` mqtt
```bash
# ssh to container
./ssh.sh "mosquitto"
# Subscribe message
/scripts/mqtt-sub.sh
# or using this instead mqtt-sub.sh
mosquitto_sub -h nats-server -p 1883 -t "NATS/MQTT/Test/#"
```

### Subcribe to NATS Subject on Terminal 2
This command will listen on subject `NATS.MQTT.Test/>` nats
```bash
# ssh to container
./ssh.sh "nats-box"
# Subscribe message
nats -s nats://nats-server sub "NATS.MQTT.Test.>"
```

### Publish to NATS subject on Terminal 3
You can execute this command several time
```bash
# ssh to container
./ssh.sh "nats-box"
# Publish message
nats -s nats://nats-server pub "NATS.MQTT.Test.>" "This is message from nats"
```

### Publish to MQTT topic on Terminal 4
You can execute this script several time
```bash
# ssh to container
./ssh.sh "mosquitto"
# Publish message
/scripts/mqtt-pub.sh
#or using this instead mqtt-pub.sh
mosquitto_pub -h nats-server -p 1883 -t "NATS/MQTT/Test/" -m "This is message from mqtt"
```