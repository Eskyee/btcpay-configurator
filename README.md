# BTCPay Configurator for Railway

This repo wraps the official `btcpayserver/btcpayserver-configurator` image so it can run correctly on Railway.

## Why this wrapper exists

Railway assigns the listening port at runtime through the `PORT` environment variable. The stock image does not guarantee that the ASP.NET app will bind to that dynamic port, so this wrapper forces the configurator to listen on `0.0.0.0:$PORT`.

## Deploy

1. Create a new Railway service from this repo.
2. Keep the `Dockerfile` deployment path.
3. Set any BTCPay configurator environment variables you need in Railway.
4. Deploy.

## Runtime behavior

- Defaults to `PORT=8080` locally.
- Uses `ASPNETCORE_URLS=http://0.0.0.0:$PORT` at startup.
- Runs `BTCPayServerDockerConfigurator.dll` as the container entrypoint.
- May return `500` until the expected BTCPay configurator environment is provided by Railway.

## Local smoke check

```bash
docker build -t btcpay-configurator .
docker run --rm -p 8080:8080 -e PORT=8080 btcpay-configurator
```
