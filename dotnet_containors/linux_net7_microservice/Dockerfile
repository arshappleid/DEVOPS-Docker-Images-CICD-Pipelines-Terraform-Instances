FROM ubuntu:22.04 AS builder
ENV PORT=5000
# install the .NET 7 SDK from the Ubuntu archive
# (no need to clean the apt cache as this is an unpublished stage)
# Install required packages
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y dotnet-sdk-7.0

# add your application code
WORKDIR /app
COPY . .

# restore nuget packages for the project
RUN dotnet restore

RUN dotnet dev-certs https --trust
EXPOSE ${PORT}
ENV ASPNETCORE_URLS=https://+:${PORT}

CMD ["dotnet", "watch","run"]
