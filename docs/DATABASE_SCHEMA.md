# Nothing X Local Database Schema (`nothing_x.db`)

Nothing X stores all synchronized telemetry from Nothing and CMF wearables in an embedded SQLite database located at:
```
/data/data/com.nothing.smartcenter/databases/nothing_x.db
```

This document catalogs the discovered tables, column schemas, and metric extraction queries.

---

## 1. Table Overview

| Table Name | Record Count | Description | Primary Value Column |
|---|---|---|---|
| `AddUpNetModelTable` | Dynamic (8–15) | Real-time aggregated metrics per date | `lastValue`, `max`, `min`, `avg` |
| `HeartRateReportDbModelTable` | 100+ | Raw time-series heart rate batches | `value`, `items` (JSON), `type=2` |
| `StepReportDbModelTable` | 50+ | Pedometer activity logs | `steps`, `goalSteps`, `calories` |
| `Spo2ReportDbModelTable` | 1–10 | Spot blood oxygen saturation readings | `value` (%) |
| `StressReportDbModelTable` | 1–10 | Spot stress measurements | `value` (0–100) |
| `SleepReportDbModelTable` | Per session | Sleep session stages (Deep, Light, REM) | `duration`, `sleepTime` |
| `NtBluetoothDeviceTable` | 1 | Currently bonded device record | `name`, `mac`, `realMac` |
| `NtDeviceHistoryTable` | 1 | Hardware metadata and firmware version | `firmwareVersion`, `serialNumber` |
| `NtSportSortModelTable` | 36+ | Configured workout & sports modes | `name`, `sort` |

---

## 2. Key Table Schemas

### `AddUpNetModelTable`
Stores high-level aggregated data for dashboard cards:
```sql
CREATE TABLE AddUpNetModelTable (
    id TEXT PRIMARY KEY,           -- e.g. "uuid:AddUpNetModelType.heartRate20261026"
    userId TEXT,
    dateNum TEXT,                  -- "20261026"
    timestamp INTEGER,             -- Epoch ms
    lastValue INTEGER,             -- LATEST REAL-TIME READING (e.g. 95 BPM, 98% SpO2)
    max INTEGER,                   -- Daily maximum
    min INTEGER,                   -- Daily minimum
    avg INTEGER,                   -- Daily average
    pressureScopes TEXT,           -- Hourly breakdown JSON
    type INTEGER
);
```

### `HeartRateReportDbModelTable`
Stores raw periodic samples synced from the watch over Bluetooth:
```sql
CREATE TABLE HeartRateReportDbModelTable (
    id TEXT PRIMARY KEY,
    userId TEXT,
    mac TEXT,                      -- Watch MAC (e.g. 3C:B0:ED:45:14:CA)
    time INTEGER,                  -- Measurement Epoch timestamp
    value INTEGER,                 -- Baseline or resting reading (e.g. 56)
    type INTEGER,                  -- 2 = continuous HR
    items TEXT,                    -- JSON array of discrete readings: [{"time":..., "value":95}]
    synchronised INTEGER,
    appVersion TEXT,
    firmwareVersion TEXT
);
```

### `StepReportDbModelTable`
Stores hourly and daily pedometer measurements:
```sql
CREATE TABLE StepReportDbModelTable (
    id TEXT PRIMARY KEY,
    userId TEXT,
    mac TEXT,
    time INTEGER,
    dateNum TEXT,                  -- "2026-10-26 11"
    steps INTEGER,                 -- Current step count (e.g. 13)
    goalSteps INTEGER,             -- Target steps (e.g. 5000)
    distance INTEGER,              -- Meters
    calories INTEGER,              -- kCal burned
    duration INTEGER,              -- Active minutes
    stands INTEGER                 -- Stand hours
);
```

---

## 3. Metric Extraction Queries Used by NothingXEnhancer

### Fetching Latest Real-Time Heart Rate
```sql
SELECT lastValue, timestamp FROM AddUpNetModelTable 
WHERE id LIKE '%heartRate%' 
ORDER BY timestamp DESC LIMIT 1;
```

### Fetching Latest Real-Time Blood Oxygen (SpO2)
```sql
SELECT lastValue, timestamp FROM AddUpNetModelTable 
WHERE id LIKE '%bloodOxygen%' 
ORDER BY timestamp DESC LIMIT 1;
```

### Fetching Latest Real-Time Stress Score
```sql
SELECT lastValue, timestamp FROM AddUpNetModelTable 
WHERE id LIKE '%pressure%' 
ORDER BY timestamp DESC LIMIT 1;
```

### Fetching Today's Steps
```sql
SELECT steps, distance, calories FROM StepReportDbModelTable 
ORDER BY time DESC LIMIT 1;
```
