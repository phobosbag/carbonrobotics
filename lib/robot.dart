final robotsJson = [
  {
    "serial": "Robot 1",
    "history": [
      {
        "timestampMs": 1675373161878,
        "location": {"latitude": 47.95127689632802, "longitude": -122.42801975583974},
        "crop": "Carrots",
        "status": "STATUS_WEEDING",
        "alarmList": [],
      },
      {
        "timestampMs": 1675373221878,
        "location": {"latitude": 47.95075592537867, "longitude": -122.42907118175702},
        "crop": "Carrots",
        "status": "STATUS_WEEDING",
        "alarmList": [],
      },
      {
        "timestampMs": 1675373281878,
        "location": {"latitude": 47.949879245167736, "longitude": -122.42884051178538},
        "crop": "Carrots",
        "status": "STATUS_WEEDING",
        "alarmList": [],
      },
    ],
  },
  {
    "serial": "Robot 2",
    "history": [
      {
        "timestampMs": 1675286761878,
        "location": {"latitude": 47.95078107582102, "longitude": -122.42772471285274},
        "crop": "Beets",
        "status": "STATUS_POWERED_DOWN",
        "alarmList": [
          {
            "timestampMs": 1675286761878,
            "code": "BRKN",
            "description": "I know what's wrong with it. Aint got no gas in it",
            "level": "HIGH",
          },
        ],
      },
    ],
  },
];
