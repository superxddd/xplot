# 1. 基础镜像（沿用 Windows 容器风格）
FROM python:3.10-windowsservercore-ltsc2022

# 2. 设置工作目录
WORKDIR C:\app

# 3. 先复制依赖文件并安装项目依赖
COPY requirements.txt ./
RUN pip install --no-cache-dir --upgrade pip && ^
    pip install --no-cache-dir -r requirements.txt

# 4. 将当前项目文件复制到容器工作目录
COPY . ./

# 5. 暴露 Streamlit 默认端口
EXPOSE 8501

# 6. 默认启动 xPlot 服务
CMD ["python", "-m", "streamlit", "run", "program/xplot.py", "--server.address=0.0.0.0", "--server.port=8501"]
