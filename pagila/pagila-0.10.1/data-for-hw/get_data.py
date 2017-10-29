import datadotworld as dw
import os

os.environ['DW_AUTH_TOKEN'] = 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwcm9kLXVzZXItY2xpZW50OnRyaWxvZ3llZCIsImlzcyI6ImFnZW50OnRyaWxvZ3llZDo6ZTVkMTBkNDgtODRmYy00ZTVjLTkzNTUtMGIwOGMzYjIxNGNlIiwiaWF0IjoxNTAzMTAxNDIzLCJyb2xlIjpbInVzZXJfYXBpX3dyaXRlIiwidXNlcl9hcGlfcmVhZCJdLCJnZW5lcmFsLXB1cnBvc2UiOnRydWV9.HpopfqxXh0VqNgb1b8tpP6G1bkr-WblRNeS3UlhF-05sSTxx1CHJgRuAjdnP8MoBIsHsysJANP27ioXqCKChgw'

url = 'trilogyed/dataviz-unit-11-hwk'
download_dir = 'Resources'

if os.path.isdir(download_dir):
    print("Resources Directory Already Exists!")
    print("Please Remove the existing Resources folder and re-run this script")
    exit()

client = dw.api_client()

print("Downloading Data...")
client.download_datapackage(url, download_dir)
print("Download Complete!")

# import requests

# url = "https://api.data.world/v0/download/trilogyed/dataviz-unit-11-activities"

# headers = {'authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwcm9kLXVzZXItY2xpZW50OnRyaWxvZ3llZCIsImlzcyI6ImFnZW50OnRyaWxvZ3llZDo6MjgyYTJkYTAtYjFhNS00ZGI2LWE1NWItMDkyOTRiMDFlNWY1IiwiaWF0IjoxNTAyNzI0NDkyLCJyb2xlIjpbInVzZXJfYXBpX3dyaXRlIiwidXNlcl9hcGlfcmVhZCJdLCJnZW5lcmFsLXB1cnBvc2UiOnRydWV9.kVYHj5TQ6xOta5NvaqJjherNsludCZdWpQJ9gciq58l8mXPy4d1a8BeQHAJRuO2UiEN0Togyi96f__GGYIBjgg'}

# chunk_size = 1024

# response = requests.get(url, headers=headers, stream=True)

# with open('Resources/hwk-3-data.zip', 'wb') as fd:
#     print("Downloading Data...")
#     for chunk in response.iter_content(chunk_size):
#         fd.write(chunk)
# print("Download Complete!")
