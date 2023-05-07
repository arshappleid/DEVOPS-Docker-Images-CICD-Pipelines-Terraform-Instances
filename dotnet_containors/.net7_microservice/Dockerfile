# Use the official .NET SDK image
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env

# Set the working directory
WORKDIR /app

# Copy the project file and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the application code
COPY . ./

# Expose port 5000
EXPOSE 5000


RUN dotnet dev-certs https --trust
ENV ASPNETCORE_URLS=https://+:5000
ENTRYPOINT ["dotnet", "watch", "run"]