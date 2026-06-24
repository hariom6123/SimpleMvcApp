# Runtime base image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app

EXPOSE 80
ENV ASPNETCORE_URLS=http://+:80

# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy project file and restore
COPY src/SimpleMvcApp.Web/*.csproj ./src/SimpleMvcApp.Web/
RUN dotnet restore ./src/SimpleMvcApp.Web/SimpleMvcApp.Web.csproj

# Copy source code
COPY src/SimpleMvcApp.Web/ ./src/SimpleMvcApp.Web/

# Publish application
RUN dotnet publish ./src/SimpleMvcApp.Web/SimpleMvcApp.Web.csproj \
    -c Release \
    -o /app/publish \
    --no-restore

# Final runtime image
FROM base AS final
WORKDIR /app

COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "SimpleMvcApp.Web.dll"]
