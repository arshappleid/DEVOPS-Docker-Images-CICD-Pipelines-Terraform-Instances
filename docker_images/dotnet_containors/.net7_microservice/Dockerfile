# Use the official .NET SDK image for building
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /app

# Copy the project file and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the application code
COPY . ./

# Publish the application , and store the output in out folder.
RUN dotnet publish -c http -o out
# Use the .NET runtime image for running the app
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app

# Copy the published files into the runtime image
COPY --from=build-env /app/out .
# Generate ssl certificate for the docker image , and import into 
# Expose port 5000
EXPOSE 6000

ENTRYPOINT ["dotnet", "app_name.dll"]
