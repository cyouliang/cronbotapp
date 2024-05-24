from os import getenv
from dotenv import load_dotenv

load_dotenv()

""" General config """
# Set ENV to any value to use webhook instead of polling for bot. Must be set in prod environment.
ENV = "prod"
TZ_OFFSET = 8.0  # (UTC+08:00)
JOB_LIMIT_PER_PERSON = 10
BATCH_SIZE = 100  # Max number of messages to send at any given time
RETRIES = 1  # Number of retries if message fails to send
BOT_NAME = "@seewaielle_bot"

""" Telegram config """
TELEGRAM_BOT_TOKEN = "6921071763:AAEqZZuhZC1223sCEb11PPR0EaCG8vtxsjM"
BOTHOST = '3.1.204.188' # "https://cyl-cronbot.onrender.com/" # only required in prod environment, used to set webhook


""" DB config """
MONGODB_CONNECTION_STRING = "mongodb+srv://yoyoliang97:mZmXEXcxubb15rNx@cluster0.zbstl8v.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0"
MONGODB_DB = "cronbot"
MONGODB_JOB_DATA_COLLECTION = "job_data"
MONGODB_CHAT_DATA_COLLECTION = "chat_data"
MONGODB_USER_DATA_COLLECTION = "user_data"
MONGODB_BOT_DATA_COLLECTION = "bot_data"
MONGODB_USER_WHITELIST_COLLECTION = "whitelist"
MONGODB_SERVING_PERSON_COLLECTION = "service_schedule"

INFLUXDB_TOKEN = getenv("INFLUXDB_TOKEN")
INFLUXDB_ORG = "main"
INFLUXDB_BUCKET = "prod"
INFLUXDB_HOST = "https://eu-central-1-1.aws.cloud2.influxdata.com"
