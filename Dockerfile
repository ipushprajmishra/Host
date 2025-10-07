# ================================
# Stage 1: Build and publish app
# ================================
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy solution and project files
COPY Host.sln ./
COPY Host/Host.csproj Host/

# Restore dependencies
RUN dotnet restore Host/Host.csproj

# Copy the rest of the source code
COPY . .

# Build and publish the app (Release mode)
RUN dotnet publish Host/Host.csproj -c Release -o /app/publish /p:UseAppHost=false


# ================================
# Stage 2: Runtime image
# ================================
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Copy published app from build stage
COPY --from=build /app/publish .

# Tell Kestrel to listen on all interfaces, port 80
ENV ASPNETCORE_URLS=http://+:80

# Expose HTTP port
EXPOSE 80

# Start the Web API
ENTRYPOINT ["dotnet", "Host.dll"]
