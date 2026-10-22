-- ====================================
-- COUPLE GOALS
-- ====================================

create table couple_goals (
    id uuid primary key default uuid_generate_v4(),

    title text not null,

    description text,

    target_value integer,

    current_value integer default 0,

    start_date date,

    end_date date,

    completed boolean default false,

    created_at timestamptz default now()
);

-- ====================================
-- DAILY WELLNESS
-- ====================================

create table wellness_logs (
    id uuid primary key default uuid_generate_v4(),

    profile_id uuid references profiles(id) on delete cascade,

    sleep_hours numeric(4,2),

    energy_level integer check (energy_level between 1 and 10),

    stress_level integer check (stress_level between 1 and 10),

    soreness_level integer check (soreness_level between 1 and 10),

    water_oz integer,

    notes text,

    logged_at timestamptz default now()
);

-- ====================================
-- SHARED CHALLENGES
-- ====================================

create table shared_challenges (
    id uuid primary key default uuid_generate_v4(),

    title text not null,

    description text,

    challenge_type text,

    target integer,

    progress integer default 0,

    completed boolean default false,

    created_at timestamptz default now()
);

-- ====================================
-- EXERCISE FAVORITES
-- ====================================

create table favorite_exercises (
    id uuid primary key default uuid_generate_v4(),

    profile_id uuid references profiles(id) on delete cascade,

    exercise_id uuid references exercises(id) on delete cascade,

    created_at timestamptz default now()
);

-- ====================================
-- CUSTOM WORKOUT TEMPLATES
-- ====================================

create table workout_templates (
    id uuid primary key default uuid_generate_v4(),

    profile_id uuid references profiles(id) on delete cascade,

    name text not null,

    description text,

    created_at timestamptz default now()
);

-- ====================================
-- AI CHAT HISTORY
-- ====================================

create table coach_chat_history (
    id uuid primary key default uuid_generate_v4(),

    profile_id uuid references profiles(id) on delete cascade,

    role text not null,

    message text not null,

    created_at timestamptz default now()
);
