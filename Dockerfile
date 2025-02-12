# Gunakan Python 3.9 sebagai base image
FROM python:3.9

# Update sistem dan install paket yang diperlukan
RUN apt update && apt upgrade -y
RUN apt install -y python3-pip ffmpeg curl

# Install Node.js 20 dan NPM terbaru
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm@latest  # Pastikan NPM versi terbaru

# Buat folder untuk aplikasi
RUN mkdir /app/
COPY . /app
WORKDIR /app

# Install dependensi Python
RUN pip3 install --upgrade pip
RUN pip3 install -U -r requirements.txt

# Jalankan aplikasi
CMD ["python3", "main.py"]
