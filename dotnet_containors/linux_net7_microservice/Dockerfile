FROM ubuntu:22.04 AS builder

# install the .NET 7 SDK from the Ubuntu archive
# (no need to clean the apt cache as this is an unpublished stage)
RUN apt-get update && apt-get install -y dotnet-sdk-7.0 ca-certificates

# add your application code
WORKDIR /source
COPY . .

# publish your .NET app
RUN dotnet publish -c Release -o /app

FROM mcr.microsoft.com/dotnet/runtime:7.0

WORKDIR /app
COPY --from=builder /app ./

ENTRYPOINT ["dotnet", "HelloWorld.dll"]
