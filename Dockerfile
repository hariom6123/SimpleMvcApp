# Dockerfile for SimpleMvcApp
# Use official .NET 8 SDK image for building, and ASP.NET runtime for launch
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443
ENV ASPNETCORE_URLS=http://+:80

# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy project files and restore packages
COPY src/SimpleMvcApp.Web/*.csproj ./src/SimpleMvcApp.Web/
RUN dotnet restore ./src/SimpleMvcApp.Web/SimpleMvcApp.Web.csproj

# Copy everything else and build
COPY src/SimpleMvcApp.Web/ ./src/SimpleMvcApp.Web/
RUN dotnet publish ./src/SimpleMvcApp.Web/SimpleMvcApp.Web.csproj -c Release -o /app/publish

# Runtime image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "SimpleMvcApp.Web.dll"]
