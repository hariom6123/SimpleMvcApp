# Dockerfile for SimpleMvcApp
# Use official .NET 8 SDK image for building, and ASP.NET runtime for launch
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443
ENV ASPNETCORE_URLS=http://+:80

# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY src/SimpleMvcApp.Web/*.csproj ./SimpleMvcApp.Web/
COPY src/SimpleMvcApp.Web/*.csproj ./src/SimpleMvcApp.Web/
COPY src/SimpleMvcApp.Web/Program.cs ./src/SimpleMvcApp.Web/
COPY src/SimpleMvcApp.Web/Program.csproj ./src/SimpleMvcApp.Web/
# For other required files, copy all
COPY src/SimpleMvcApp.Web/ ./src/SimpleMvcApp.Web/
COPY src/SimpleMvcApp.Web/Views/ ./src/SimpleMvcApp.Web/Views/
COPY src/SimpleMvcApp.Web/Controllers/ ./src/SimpleMvcApp.Web/Controllers/
COPY src/SimpleMvcApp.Web/Services/ ./src/SimpleMvcApp.Web/Services/

RUN dotnet restore ./src/SimpleMvcApp.Web/SimpleMvcApp.Web.csproj
RUN dotnet publish ./src/SimpleMvcApp.Web/SimpleMvcApp.Web.csproj -c Release -o /app/publish

# Runtime image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "SimpleMvcApp.Web.dll"]
