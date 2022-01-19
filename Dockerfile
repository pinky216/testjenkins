FROM ubuntu
LABEL maintainer="pinky.kumari@signanthealth.com"
LABEL name="Test

ARG ARTIFACTORY_AUTH

RUN apt-get update && \
    apt-get install --assume-yes --quiet --no-install-recommends \
    curl \
    xz-utils \
    python3  \
    python3-pip  \
    python3-dev \
    python3-wheel \
    python3-setuptools \
    unzip \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Chrome and chromedriver dependencies
RUN apt-get -y update && \
    apt-get -y install --quiet --no-install-recommends \
    libxpm4 libxrender1 libgtk2.0-0 libnss3 \
    libgconf-2-4 gtk2-engines-pixbuf libgbm1 wget \
    dbus-x11 xfonts-base xfonts-100dpi xfonts-75dpi \
    xfonts-cyrillic xfonts-scalable fonts-liberation \
    xdg-utils libxss1 libappindicator3-1 libindicator7 \
    libasound2 libatk-bridge2.0-0 libgtk-3-0 lsb-release \
    libx11-xcb1 libxcb-dri3-0 libxtst6 libxshmfence1 && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get -y update && \
    apt-get -y install build-essential autoconf libtool pkg-config python-opengl python-pil python-pyrex qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev libssl-dev && \
    rm -rf /var/lib/apt/lists/*

# Chrome
RUN wget --no-verbose https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg --install google-chrome-stable_current_amd64.deb; apt-get --fix-broken --assume-yes install

# ChromeDriver
RUN CHROMEDRIVER_VERSION=`wget --no-verbose --output-document - https://chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
    wget --no-verbose --output-document /tmp/chromedriver_linux64.zip http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip && \
    unzip -qq /tmp/chromedriver_linux64.zip -d /tmp/chromedriver && \
    chmod +x /tmp/chromedriver/chromedriver && \
    mv /tmp/chromedriver/chromedriver /usr/local/bin/chromedriver

COPY requirements.txt /requirements.txt
RUN python3 -m pip install -U pip && python3 -m pip install -U -r /requirements.txt

ENV myapp="This is a sample"


RUN useradd -u 1000 -m jenkins
USER jenkins
# ---- only for Jenkin-less environment ------
#COPY . .
#CMD ["python3", "test.py", "-E", "BKTSFRDSQL02", "-S", "DtPMockStudy", "-D", "SignantDtPMockStudy_V44", "-w", "1"]
