FROM btcpayserver/btcpayserver-configurator:latest

EXPOSE 8080

ENV PORT=8080

# Railway injects PORT at runtime, so force ASP.NET to bind on all interfaces.
ENTRYPOINT ["sh", "-c", "export ASPNETCORE_URLS=http://0.0.0.0:${PORT:-8080}; exec dotnet BTCPayServerDockerConfigurator.dll"]
