🌐 Networking Guid

📌 Purpose
This document explains how to configure networking so your self‑hosted services (Nextcloud, Immich, CasaOS) are accessible outside your home network. It covers port forwarding, dynamic DNS (DuckDNS), and optional secure tunnels.

🔑 Key Concepts
- Local IP: The private IP address of your server inside your home network (e.g., 192.168.x.x).
- Public IP: The IP address assigned by your ISP. This changes if you don’t have a static IP.
- Port Forwarding: Router configuration that forwards external traffic (e.g., port 443) to your server.
- Dynamic DNS (DDNS): Maps a domain name to your changing public IP (DuckDNS in this project).
- Secure Tunnel: Optional services like Cloudflare Tunnel or Tailscale for added security.

🚪 Step 1: Port Forwarding
1. 	Log in to your router’s admin panel.
2. 	Find Port Forwarding / NAT settings.
3. 	Forward:
• 	 → server IP (HTTP)
• 	 → server IP (HTTPS)
4. 	Save and reboot router.
5. 	Test by visiting http://<your-public-ip>

🦆 Step 2: Dynamic DNS with DuckDNS
1. 	Register at DuckDNS.
2. 	Create a domain (e.g., myhomeserver.duckdns.org).
3. 	Install cron job script (scripts/duckdns-cron.sh)
