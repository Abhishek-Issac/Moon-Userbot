FROM python:3.11
WORKDIR /app
COPY . /app
RUN apt-get -qq update && apt-get -qq install -y git wget ffmpeg mediainfo \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir -r requirements.txt
RUN git clone https://github.com/The-MoonTg-project/custom_modules /app/modules
CMD ["python", "main.py"]
