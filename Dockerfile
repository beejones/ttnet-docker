FROM pytorch/pytorch

# Install git and necessary libraries for OpenCV
RUN apt-get update && apt-get install -y git libgl1-mesa-glx libglib2.0-0

# Clone the repository
RUN git clone https://github.com/AugustRushG/TTNet-Real-time-Analysis-System-for-Table-Tennis-Pytorch /ttnet

# Set the working directory
WORKDIR /ttnet

# Install dependencies
RUN pip install --no-cache-dir -r requirement.txt

# Setup the dataset
WORKDIR /ttnet/prepare_dataset
RUN python download_dataset.py
RUN python unzip.py
RUN python extract_selected_images.py
RUN python extract_smooth_labellings.py

WORKDIR /ttnet

# Keep the container running indefinitely
CMD ["tail", "-f", "/dev/null"]