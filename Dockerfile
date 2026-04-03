FROM btcpayserver/btcpayserver-configurator:latest

EXPOSE 80

# Railway will set the PORT env var
ENV PORT=80

# Run the Configurator
ENTRYPOINT ["dotnet", "BTCPayServer.Configurator.dll"]
