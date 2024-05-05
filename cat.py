import time
import requests
import random
from discord_webhook import DiscordWebhook, DiscordEmbed
from datetime import datetime

def fetch_cat_image():
    response = requests.get('https://api.thecatapi.com/v1/images/search')
    data = response.json()
    if data:
        return data[0]['url']
    return None

def send_cat_webhook(webhook_url, cat_image_url):
    webhook = DiscordWebhook(url=webhook_url)
    embed = DiscordEmbed(title="Kitty Cat", color=random_color())
    embed.set_image(url=cat_image_url)
    embed.set_footer(text="https://discord.gg/relaby | {}".format(current_timestamp()))
    webhook.add_embed(embed)
    response = webhook.execute()
    return response.status_code == 200

def random_color():
    r = random.randint(0, 255)
    g = random.randint(0, 255)
    b = random.randint(0, 255)
    return int('%02x%02x%02x' % (r, g, b), 16)

def current_timestamp():
    return datetime.now().strftime("%d/%m/%Y")

def main():
    webhook_url = "https://discord.com/api/webhooks/1236490171457867836/scmpqZEkW-nX67TJTtERDuWyl3UtvFzvGZbOXLGkLs96LlFtzC1y8f9Q8zZZMNhnoGHy"

    while True:
        cat_image_url = fetch_cat_image()
        if cat_image_url:
            success = send_cat_webhook(webhook_url, cat_image_url)
            if success:
                print("Cat sent successfully!")
            else:
                print("Failed to send cat :(")
        else:
            print("Failed to fetch cat image.")

        time.sleep(0.5)  # Wait for 1 second before fetching the next cat

if __name__ == "__main__":
    main()
