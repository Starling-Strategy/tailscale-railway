# Tailscale Exit Node on Railway

This project sets up a Tailscale exit node on Railway using userspace networking. It allows you to create your own secure exit node for routing internet traffic like a VPN.

## How It Works

This project uses a Docker container running on Railway. The container:

1. Installs Tailscale in an Alpine Linux environment.
2. Runs Tailscale in userspace networking mode.
3. Configures the node as an exit node.

## Setup Instructions

1. Fork this repository to your GitHub account.

2. Join the Railway team.

3. Clone your forked repository to your local machine.

4. Update the Configuration:

   - Open `start.sh` in your text editor.
   - Change `--hostname=railway-exit-node` to a unique name of your choice, e.g., `--hostname=my-custom-exit-node`.
   - If you have other configurations or environment variables that need to be unique, update them accordingly.

5. Create a New Railway Project:

   - In your project directory, run: `railway init`

6. Generate a Tailscale auth key:

   - Go to the [Tailscale Admin Console](https://login.tailscale.com/admin/settings/keys).
   - Click "Generate auth key" and create a reusable key.

7. In your Railway project, add the following environment variable:

   - Key: `TAILSCALE_AUTHKEY`
   - Value: Your generated Tailscale auth key

8. Deploy your project on Railway in the repo:

   - Run: `railway up`

9. Once deployed, go to your Tailscale admin console and:

   - Set the Exit node by clicking the 3 dots and Edit Route ACL and set the exit node.
   - Set Key expiry to no-expiry

10. On your local device, configure Tailscale to use the new exit node or connect with the UI.
    ```
    tailscale up --exit-node=<your-exit-node-ip>
    ```

## Advanced Configuration

For advanced users, you can modify the `start.sh` script or `Dockerfile` to customize the setup. For example, you could add additional networking tools or change the Tailscale version.
