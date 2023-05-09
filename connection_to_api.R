library(httr)

# Set credentials (available in 1 password)
rsc_server <- Sys.getenv("RSC_SERVER")
rsc_api_key <- Sys.getenv("RSC_API_KEY")
app_giud <- Sys.getenv("APP_GUID")

# Set start and end date for the data
start_date <- as.Date("2021-07-01")
end_date <- as.Date(lubridate::now(tz = "UTC"))

# Generate API call URL and authorization header
api_call_url <- paste0(rsc_server, "__api__/v1/instrumentation/shiny/usage?limit=30", 
                       "&content_guid=", app_giud,
                       "&from=", format(start_date, "%Y-%m-%dT%H:%M:%SZ"),
                       "&to=", format(end_date, "%Y-%m-%dT%H:%M:%SZ"))
api_auth_header <- paste("Key", rsc_api_key)

# Request the first 30 records
response <- RETRY(
  "GET",
  api_call_url,
  add_headers(Authorization = api_auth_header)
)
payload <- content(response)