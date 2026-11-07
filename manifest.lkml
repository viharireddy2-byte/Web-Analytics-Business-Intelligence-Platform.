project_name: "sessionlens"

# ---------------------------------------------------------------------------
# Connection & source constants (override these in the consuming project)
# ---------------------------------------------------------------------------
constant: CONNECTION {
  value: "bigquery_ga4"
  export: override_required
}

constant: GA_PROJECT {
  value: "my-gcp-project"
  export: override_required
}

constant: GA_DATASET {
  value: "analytics_123456789"
  export: override_required
}

# How far back the sessionization PDTs read on a FULL build. Incremental builds
# only rewrite the trailing partitions (see increment_offset in the PDTs).
constant: HISTORY_DAYS {
  value: "730"
  export: override_optional
}

# ---------------------------------------------------------------------------
# Channel-grouping rules (regexes are BigQuery RE2, matched case-insensitively
# against LOWER(source)). Kept as constants so they are tunable per business.
# ---------------------------------------------------------------------------
constant: SEARCH_SOURCES_REGEX {
  value: "(google|bing|yahoo|duckduckgo|baidu|yandex|ecosia|naver|ask|aol|qwant|seznam)"
  export: override_optional
}

constant: SOCIAL_SOURCES_REGEX {
  value: "(facebook|instagram|linkedin|twitter|t[.]co|x[.]com|pinterest|reddit|tiktok|snapchat|quora|tumblr|whatsapp)"
  export: override_optional
}

constant: VIDEO_SOURCES_REGEX {
  value: "(youtube|vimeo|twitch|dailymotion)"
  export: override_optional
}

# ---------------------------------------------------------------------------
# ML settings
# ---------------------------------------------------------------------------
constant: ML_ENABLED {
  value: "Yes"
  export: override_optional
}

constant: PROPENSITY_LOOKBACK_DAYS {
  value: "30"
  export: override_optional
}

constant: PROPENSITY_HORIZON_DAYS {
  value: "7"
  export: override_optional
}

constant: FORECAST_HORIZON_DAYS {
  value: "30"
  export: override_optional
}

# Source dataset region for project-scoped TABLE_STORAGE metadata. Match the
# Looker connection job location, for example us, eu, or us-central1.
constant: GA_LOCATION {
  value: "us"
  export: override_optional
}
