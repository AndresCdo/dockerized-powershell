FROM mcr.microsoft.com/powershell

WORKDIR app
COPY main.ps1 main.ps1
RUN chmod +x main.ps1

ENTRYPOINT ["pwsh", "./main.ps1"]
