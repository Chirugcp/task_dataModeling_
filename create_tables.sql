-- Parent Table
CREATE TABLE targeting_dimension (
    targeting_id INT PRIMARY KEY,
    age_min INT,
    age_max INT,
    gender STRING,
    country STRING,
    locales ARRAY<INT>,
    raw_json JSON
);

-- Child Table: Interests
CREATE TABLE targeting_interest (
    interest_id INT PRIMARY KEY,
    targeting_id INT,
    interest_name STRING,
    interest_code STRING,
    FOREIGN KEY (targeting_id) REFERENCES targeting_dimension(targeting_id)
);

-- Child Table: Device Platforms
CREATE TABLE targeting_device_platforms (
    id INT PRIMARY KEY,
    targeting_id INT,
    device_platform STRING,
    FOREIGN KEY (targeting_id) REFERENCES targeting_dimension(targeting_id)
);

-- Child Table: Ad Positions
CREATE TABLE targeting_positions (
    id INT PRIMARY KEY,
    targeting_id INT,
    position_name STRING,
    FOREIGN KEY (targeting_id) REFERENCES targeting_dimension(targeting_id)
);

-- Child Table: Flexible Spec (Nested Attributes)
CREATE TABLE targeting_flexible_spec (
    flex_id INT PRIMARY KEY,
    targeting_id INT,
    spec_type STRING,
    spec_value STRING,
    FOREIGN KEY (targeting_id) REFERENCES targeting_dimension(targeting_id)
);
