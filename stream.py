import requests 
import subprocess

url = 'https://api.elevenlabs.io/v1/text-to-speech/kpX6SCgmllKT2WJpG9MC/stream'
headers = {
    'accept': 'audio/mpeg',
    'xi-api-key': 'c18ef457b32bb0ae98e4e74360b869fb',
    'Content-Type': 'application/json'
}
data = {
    'text': 'This is pretty fast huh?! Look at me talking away! ooooh yeah, baby!',
    "model_id": "eleven_monolingual_v1",
    "voice_settings": {
        "stability": 0,
        "similarity_boost": 0
  }
}

response = requests.post(url, headers=headers, json=data, stream=True)
response.raise_for_status()

# use subprocess to pipe the audio data to ffplay and play it
ffplay_cmd = ['ffplay', '-autoexit', '-']
ffplay_proc = subprocess.Popen(ffplay_cmd, stdin=subprocess.PIPE)
for chunk in response.iter_content(chunk_size=4096):
    ffplay_proc.stdin.write(chunk)
    print("Downloading...")

# close the ffplay process when finished
ffplay_proc.stdin.close()
ffplay_proc.wait()