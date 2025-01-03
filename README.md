# ttnet-docker
Create a docker container for https://github.com/AugustRushG/TTNet-Real-time-Analysis-System-for-Table-Tennis-Pytorch

# Run the trained container
```bash
sudo docker run -it --name ttnet-trained --gpus all -p 6006:6006 beejones/ttnet-trained:latest /bin/bash
```

# Run the prepared container
```bash
sudo docker run -it --name ttnet --gpus all -p 6006:6006 beejones/ttnet:latest /bin/bash

# Train the container in shell
pip uninstall numpy
pip install numpy==1.24.0
cd src
python main.py --gpu_idx 0
```

# Build the container
```
docker-compose up
```

# Stop the container
```
docker-compose down
```
