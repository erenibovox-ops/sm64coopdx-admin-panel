-- name: Admin Panel
-- description: Admin panel for the host and moderators. Type /admin panel or /ap in chat.\nControls: Stick/D-Pad = move, A (jump) = confirm, B (attack) = back/close.\nBring, teleport, spectate, freeze, mute, kick/ban, announcements and more.

-----------------------------------------------------------
-- Settings you can tweak
-----------------------------------------------------------
local B_CLOSES_ALL = false   -- false: B goes back one page (closes on the main page). true: B always closes the panel.
local FONT_CENTER  = 19      -- text vertical centering. If text sits too low in its row, raise this; too high, lower it.
local VIS          = 11      -- rows visible on screen
local ROW          = 14      -- row height

-----------------------------------------------------------
-- Language (English at every game start)
-----------------------------------------------------------
local lang = "en"

local T = {
    en = {
        langname = "English",
        title = "ADMIN PANEL",
        foot = "A: Confirm    B: Back / Close",
        min = "m",

        hint = "[Admin Panel] Open with /admin panel or /ap. Only the host or a moderator can use it.",
        noperm = "This command is only for the host and moderators.",
        usage = "Usage: /admin panel   or   /admin announce <message>",

        m_bring_all = "Bring everyone to me",
        m_players = "Player actions >",
        m_freeze_all = "Freeze everyone",
        m_unfreeze_all = "Unfreeze everyone",
        m_levels = "Warp everyone to level >",
        m_announce = "Announce: type /admin announce <msg>",
        m_settings = "Settings and logs >",
        m_stop_spec = "Stop spectating",
        m_close = "Close",
        back = "< Back",

        p_bring = "Bring to me",
        p_goto = "Teleport to them",
        p_spectate = "Watch their camera",
        p_freeze = "Freeze",
        p_unfreeze = "Unfreeze",
        p_mute = "Mute",
        p_unmute = "Unmute",
        p_fun = "Powers / fun >",
        p_mgmt = "Management >",

        f_invis = "Invisibility: %s",
        f_god = "Godmode: %s",
        f_boost = "Speed/jump boost: x%d (change)",
        f_heal = "Heal",
        f_kill = "Kill",
        on = "Turn on",
        off = "Turn off",

        g_kick = "Kick",
        g_ban = "BAN (permanent)",
        g_mod_on = "Make moderator",
        g_mod_off = "Remove moderator",

        s_lang = "Language: %s (change)",
        s_bans = "Ban list >",
        s_log = "Action log >",
        unban_item = "%s  (unban)",

        c_kill = "YES, kill",
        c_kick = "YES, kick",
        c_ban = "YES, ban",
        c_warp = "YES, warp everyone",
        c_unban = "YES, unban",
        c_no = "No, cancel",

        t_owner = " [OWNER]", t_mod = " [MOD]", t_frozen = " [FROZEN]",
        t_muted = " [MUTED]", t_hidden = " [HIDDEN]", t_god = " [GOD]",

        h_frozen = "YOU ARE FROZEN",
        h_muted = "You are muted",
        h_watching = "Watching: %s   HP: %d",
        h_difflevel = "  (different level!)",
        h_spec_help = "Left/Right = switch player   B = exit",

        kick_fail = "This version has no Lua kick. Type in chat: /kick %s",
        ban_join = "Banned player joined: %s - type /kick %s in chat.",

        log_bring_all = "%s: called everyone to them",
        log_bring = "%s: called %s",
        log_freeze = "%s: froze/unfroze %s",
        log_freeze_all_on = "%s: froze everyone",
        log_freeze_all_off = "%s: unfroze everyone",
        log_mute = "%s: muted/unmuted %s",
        log_invis = "%s: toggled invisibility of %s",
        log_god = "%s: toggled godmode of %s",
        log_boost = "%s: set speed of %s to x%d",
        log_kill = "%s: killed %s",
        log_heal = "%s: healed %s",
        log_kick = "%s: kicked %s",
        log_ban = "%s: BANNED %s",
        log_unban = "%s: removed a ban (%s)",
        log_mod = "%s: changed moderator status of %s",
        log_warp_all = "%s: warped everyone to a level",
        log_announce = "%s: announcement",
    },
    tr = {
        langname = "Turkce",
        title = "ADMIN PANEL",
        foot = "A: Onayla    B: Geri / Kapat",
        min = "dk",

        hint = "[Admin Panel] /admin panel veya /ap yazarak ac. Sadece host veya moderator kullanabilir.",
        noperm = "Bu komut sadece oda sahibi ve moderatorler icindir.",
        usage = "Kullanim: /admin panel   veya   /admin duyuru <mesaj>",

        m_bring_all = "Herkesi yanima cagir",
        m_players = "Oyuncu islemleri >",
        m_freeze_all = "Herkesi dondur",
        m_unfreeze_all = "Herkesin dondurmasini coz",
        m_levels = "Herkesi levele isinla >",
        m_announce = "Duyuru icin sohbete: /admin duyuru mesaj",
        m_settings = "Ayarlar ve kayitlar >",
        m_stop_spec = "Kamera izlemeyi birak",
        m_close = "Kapat",
        back = "< Geri",

        p_bring = "Yanima cagir",
        p_goto = "Yanina isinlan",
        p_spectate = "Kamerasini izle",
        p_freeze = "Dondur",
        p_unfreeze = "Dondurmayi coz",
        p_mute = "Sustur",
        p_unmute = "Susturmayi ac",
        p_fun = "Guc / eglence >",
        p_mgmt = "Yonetim >",

        f_invis = "Gorunmezlik: %s",
        f_god = "Godmode: %s",
        f_boost = "Hiz/ziplama boost: x%d (degistir)",
        f_heal = "Can ver",
        f_kill = "Oldur",
        on = "Ac",
        off = "Kapat",

        g_kick = "Kick (at)",
        g_ban = "BAN (kalici)",
        g_mod_on = "Moderator yap",
        g_mod_off = "Moderatorlugu al",

        s_lang = "Dil: %s (degistir)",
        s_bans = "Ban listesi >",
        s_log = "Islem logu >",
        unban_item = "%s  (banini kaldir)",

        c_kill = "EVET, oldur",
        c_kick = "EVET, kick at",
        c_ban = "EVET, banla",
        c_warp = "EVET, herkesi isinla",
        c_unban = "EVET, banini kaldir",
        c_no = "Hayir, vazgec",

        t_owner = " [SAHIP]", t_mod = " [MOD]", t_frozen = " [DONMUS]",
        t_muted = " [SUSTURULMUS]", t_hidden = " [GIZLI]", t_god = " [GOD]",

        h_frozen = "DONDURULDUN",
        h_muted = "Susturuldun",
        h_watching = "Izleniyor: %s   Can: %d",
        h_difflevel = "  (farkli level!)",
        h_spec_help = "Sol/Sag = oyuncu degistir   B = cik",

        kick_fail = "Bu surumde Lua ile kick yok. Sohbete su komutu yaz: /kick %s",
        ban_join = "Banli oyuncu girdi: %s - sohbete /kick %s yaz.",

        log_bring_all = "%s: herkesi cagirdi",
        log_bring = "%s: %s cagirdi",
        log_freeze = "%s: %s dondur/coz",
        log_freeze_all_on = "%s: herkesi dondurdu",
        log_freeze_all_off = "%s: herkesi cozdu",
        log_mute = "%s: %s sustur/ac",
        log_invis = "%s: %s gorunmezlik",
        log_god = "%s: %s godmode",
        log_boost = "%s: %s hiz x%d",
        log_kill = "%s: %s oldurdu",
        log_heal = "%s: %s can verdi",
        log_kick = "%s: %s kick",
        log_ban = "%s: %s BAN",
        log_unban = "%s: ban kaldirdi (%s)",
        log_mod = "%s: %s moderator degisti",
        log_warp_all = "%s: herkesi levele isinladi",
        log_announce = "%s: duyuru",
    },
}

local function L(key, ...)
    local s = (T[lang] and T[lang][key]) or T.en[key] or key
    if select("#", ...) > 0 then return string.format(s, ...) end
    return s
end

-----------------------------------------------------------
-- General state
-----------------------------------------------------------
local menu = { open = false, page = "main", sel = 1, scroll = 0, target = nil, confirm = nil }
local spectating = nil          -- local index of the player being watched
local pending = nil             -- teleport to apply after a level change
local announce = { text = "", timer = 0 }
local logLines = {}
local wasInvis = {}
local seenGlobal = {}
local warnedBan = {}
local lastBoostAction = nil
local hintShown = false

-- input (own edge detection so holding a button counts as ONE press)
local prevDown = 0
local prevStickY = 0
local prevStickX = 0
local wasCaptured = false
local suppress = false
local SUPPRESS_MASK = A_BUTTON | B_BUTTON | U_JPAD | D_JPAD | L_JPAD | R_JPAD

local LEVELS = {
    { "Castle Grounds",     "Kale Bahcesi",        LEVEL_CASTLE_GROUNDS },
    { "Castle Inside",      "Kale Ici",            LEVEL_CASTLE },
    { "Bob-omb Battlefield","Bob-omb Savasi",      LEVEL_BOB },
    { "Whomp's Fortress",   "Whomp Kalesi",        LEVEL_WF },
    { "Jolly Roger Bay",    "Jolly Roger Korfezi", LEVEL_JRB },
    { "Cool, Cool Mountain","Cool Cool Dagi",      LEVEL_CCM },
    { "Big Boo's Haunt",    "Big Boo Evi",         LEVEL_BBH },
    { "Hazy Maze Cave",     "Hazy Maze Magarasi",  LEVEL_HMC },
    { "Lethal Lava Land",   "Lethal Lava Land",    LEVEL_LLL },
    { "Shifting Sand Land", "Shifting Sand Land",  LEVEL_SSL },
    { "Dire, Dire Docks",   "Dire Dire Docks",     LEVEL_DDD },
    { "Snowman's Land",     "Snowman's Land",      LEVEL_SL },
    { "Wet-Dry World",      "Wet-Dry World",       LEVEL_WDW },
    { "Tall, Tall Mountain","Tall Tall Mountain",  LEVEL_TTM },
    { "Tiny-Huge Island",   "Tiny-Huge Island",    LEVEL_THI },
    { "Tick Tock Clock",    "Tick Tock Clock",     LEVEL_TTC },
    { "Rainbow Ride",       "Rainbow Ride",        LEVEL_RR },
}

-----------------------------------------------------------
-- Helpers
-----------------------------------------------------------
local function msg(text)
    djui_chat_message_create(text)
end

local function clean(name)
    return (name:gsub("\\#[%x]+\\", ""))
end

local function split(s, sep)
    local t = {}
    if s == nil or s == "" then return t end
    for p in string.gmatch(s, "[^" .. sep .. "]+") do table.insert(t, p) end
    return t
end

local function load_list(key) return split(mod_storage_load(key), "|") end
local function save_list(key, t) mod_storage_save(key, table.concat(t, "|")) end

local function in_list(t, v)
    for _, x in ipairs(t) do if x == v then return true end end
    return false
end

local function remove_from(t, v)
    for k, x in ipairs(t) do
        if x == v then table.remove(t, k) return end
    end
end

local function is_host_idx(i)
    return gNetworkPlayers[i].globalIndex == 0
end

local function gidx(i)
    return gNetworkPlayers[i].globalIndex
end

local function flag(prefix, i)
    return gGlobalSyncTable[prefix .. gidx(i)]
end

local function set_flag(prefix, i, v)
    gGlobalSyncTable[prefix .. gidx(i)] = v
end

local function local_from_global(g)
    for i = 0, MAX_PLAYERS - 1 do
        if gNetworkPlayers[i].connected and gNetworkPlayers[i].globalIndex == g then
            return i
        end
    end
    return nil
end

local function can_admin_local()
    return network_is_server() or flag("adm", 0) == true
end

local function other_players()
    local list = {}
    for i = 1, MAX_PLAYERS - 1 do
        if gNetworkPlayers[i].connected then table.insert(list, i) end
    end
    return list
end

local function add_log(text)
    table.insert(logLines, "[" .. math.floor(get_global_timer() / 1800) .. L("min") .. "] " .. text)
    while #logLines > 30 do table.remove(logLines, 1) end
    save_list("log", logLines)
end

-----------------------------------------------------------
-- Saved data
-----------------------------------------------------------
logLines = load_list("log")

-----------------------------------------------------------
-- Teleporting
-----------------------------------------------------------
local function place_mario(x, y, z)
    local m = gMarioStates[0]
    m.pos.x = x
    m.pos.y = y + 20
    m.pos.z = z
    m.vel.x = 0
    m.vel.y = 0
    m.vel.z = 0
    m.forwardVel = 0
    set_mario_action(m, ACT_FREEFALL, 0)
end

local function apply_teleport(x, y, z, level, area, act)
    local np = gNetworkPlayers[0]
    if np.currLevelNum == level and np.currAreaIndex == area then
        place_mario(x, y, z)
    else
        pending = { x = x, y = y, z = z, level = level, area = area, timer = 0 }
        warp_to_level(level, area, act)
    end
end

local function pos_packet(i, target)
    local m = gMarioStates[i]
    local np = gNetworkPlayers[i]
    return {
        type = "tp", target = target, src = gidx(i),
        x = m.pos.x, y = m.pos.y, z = m.pos.z,
        level = np.currLevelNum, area = np.currAreaIndex, act = np.currActNum
    }
end

-----------------------------------------------------------
-- Packets (receiving side)
-----------------------------------------------------------
local function handle_packet(data)
    local me = gNetworkPlayers[0].globalIndex
    if data.type == "tp" then
        if data.src == me then return end
        if data.target == -1 or data.target == me then
            apply_teleport(data.x, data.y, data.z, data.level, data.area, data.act)
        end
    elseif data.type == "warp" then
        if data.target == -1 or data.target == me then
            warp_to_level(data.level, 1, 1)
        end
    elseif data.type == "fx" then
        if data.target == me then
            local m = gMarioStates[0]
            if data.fx == "kill" then
                m.health = 0xFF
                set_mario_action(m, ACT_STANDING_DEATH, 0)
            elseif data.fx == "heal" then
                m.health = 0x880
            end
        end
    elseif data.type == "ann" then
        announce.text = data.text
        announce.timer = 300
    end
end

local perform  -- forward declaration

hook_event(HOOK_ON_PACKET_RECEIVE, function(data)
    if data.type == "req" then
        -- Only the host processes moderator requests
        if network_is_server() then
            local from = local_from_global(data.from)
            if from and flag("adm", from) == true then
                perform(from, data.action, local_from_global(data.target), data.arg)
            end
        end
        return
    end
    handle_packet(data)
end)

local function send_to(i, data)
    if i == 0 then handle_packet(data) else network_send_to(i, true, data) end
end

local function broadcast(data)
    network_send(true, data)
    handle_packet(data)
end

-----------------------------------------------------------
-- Kick / ban
-----------------------------------------------------------
local function try_kick(i)
    for _, name in ipairs({ "network_kick_player", "kick_or_ban_player", "network_kick" }) do
        local f = _G[name]
        if type(f) == "function" then
            local ok = pcall(f, i, false)
            if ok then return true end
        end
    end
    return false
end

-----------------------------------------------------------
-- Actions (run on the host)
-----------------------------------------------------------
local hostOnly = { ban = true, unban = true, mod = true }

local function protected(t, from)
    if is_host_idx(from) then return false end
    return is_host_idx(t) or flag("adm", t) == true
end

perform = function(from, action, t, arg)
    if hostOnly[action] and not is_host_idx(from) then return end
    local who = clean(gNetworkPlayers[from].name)

    if t ~= nil and protected(t, from) then return end
    local tn = t and clean(gNetworkPlayers[t].name) or "-"

    if action == "bring_all" then
        broadcast(pos_packet(from, -1))
        add_log(L("log_bring_all", who))
    elseif action == "bring" and t ~= nil then
        send_to(t, pos_packet(from, gidx(t)))
        add_log(L("log_bring", who, tn))
    elseif action == "freeze" and t ~= nil then
        set_flag("frz", t, not (flag("frz", t) == true))
        add_log(L("log_freeze", who, tn))
    elseif action == "freeze_all" then
        for i = 0, MAX_PLAYERS - 1 do
            if gNetworkPlayers[i].connected and i ~= from and not protected(i, from)
                and not is_host_idx(i) and flag("adm", i) ~= true then
                set_flag("frz", i, arg == true)
            end
        end
        add_log(L(arg == true and "log_freeze_all_on" or "log_freeze_all_off", who))
    elseif action == "mute" and t ~= nil then
        set_flag("mut", t, not (flag("mut", t) == true))
        add_log(L("log_mute", who, tn))
    elseif action == "invis" and t ~= nil then
        set_flag("inv", t, not (flag("inv", t) == true))
        add_log(L("log_invis", who, tn))
    elseif action == "god" and t ~= nil then
        set_flag("god", t, not (flag("god", t) == true))
        add_log(L("log_god", who, tn))
    elseif action == "boost" and t ~= nil then
        local cur = flag("spd", t) or 1
        if cur >= 3 then cur = 1 else cur = cur + 1 end
        set_flag("spd", t, cur)
        add_log(L("log_boost", who, tn, cur))
    elseif action == "kill" and t ~= nil then
        send_to(t, { type = "fx", target = gidx(t), fx = "kill" })
        add_log(L("log_kill", who, tn))
    elseif action == "heal" and t ~= nil then
        send_to(t, { type = "fx", target = gidx(t), fx = "heal" })
        add_log(L("log_heal", who, tn))
    elseif action == "kick" and t ~= nil then
        if not try_kick(t) then
            msg(L("kick_fail", tn))
        end
        add_log(L("log_kick", who, tn))
    elseif action == "ban" and t ~= nil then
        local bans = load_list("bans")
        local rawName = gNetworkPlayers[t].name
        if not in_list(bans, rawName) then
            table.insert(bans, rawName)
            save_list("bans", bans)
        end
        if not try_kick(t) then
            msg(L("kick_fail", tn))
        end
        add_log(L("log_ban", who, tn))
    elseif action == "unban" then
        local bans = load_list("bans")
        remove_from(bans, arg)
        save_list("bans", bans)
        add_log(L("log_unban", who, tostring(arg)))
    elseif action == "mod" and t ~= nil then
        local admins = load_list("admins")
        local rawName = gNetworkPlayers[t].name
        if flag("adm", t) == true then
            set_flag("adm", t, false)
            remove_from(admins, rawName)
        else
            set_flag("adm", t, true)
            if not in_list(admins, rawName) then table.insert(admins, rawName) end
        end
        save_list("admins", admins)
        add_log(L("log_mod", who, tn))
    elseif action == "warp_all" then
        broadcast({ type = "warp", target = -1, level = tonumber(arg) or LEVEL_CASTLE_GROUNDS })
        add_log(L("log_warp_all", who))
    elseif action == "announce" then
        broadcast({ type = "ann", text = tostring(arg) })
        add_log(L("log_announce", who))
    end
end

-- Local admin's request (the host runs it directly, moderators send it to the host)
local function request(action, targetLocal, arg)
    if network_is_server() then
        perform(0, action, targetLocal, arg)
    else
        local data = {
            type = "req", action = action,
            from = gNetworkPlayers[0].globalIndex,
            target = targetLocal and gidx(targetLocal) or -1,
            arg = arg == nil and "" or arg
        }
        local hostLocal = local_from_global(0)
        if hostLocal then network_send_to(hostLocal, true, data) else network_send(true, data) end
    end
end

-----------------------------------------------------------
-- Spectating
-----------------------------------------------------------
local function start_spectate(i)
    spectating = i
    camera_freeze()
    menu.open = false
end

local function stop_spectate()
    if spectating ~= nil then
        spectating = nil
        camera_unfreeze()
    end
end

local function cycle_spectate(dir)
    local list = other_players()
    if #list == 0 then stop_spectate() return end
    local cur = 1
    for k, i in ipairs(list) do if i == spectating then cur = k end end
    cur = cur + dir
    if cur < 1 then cur = #list elseif cur > #list then cur = 1 end
    spectating = list[cur]
end

-----------------------------------------------------------
-- Menu
-----------------------------------------------------------
local function goto_page(p)
    menu.page = p
    menu.sel = 1
    menu.scroll = 0
end

local function ask_confirm(label, fn, back)
    menu.confirm = { label = label, fn = fn, back = back }
    goto_page("confirm")
end

local function tags(i)
    local s = ""
    if is_host_idx(i) then s = s .. L("t_owner") end
    if flag("adm", i) == true then s = s .. L("t_mod") end
    if flag("frz", i) == true then s = s .. L("t_frozen") end
    if flag("mut", i) == true then s = s .. L("t_muted") end
    if flag("inv", i) == true then s = s .. L("t_hidden") end
    if flag("god", i) == true then s = s .. L("t_god") end
    return s
end

local function onoff(v) return v == true and L("off") or L("on") end

local build_items
build_items = function()
    local list = {}
    local function add(label, fn) table.insert(list, { label = label, fn = fn or function() end }) end
    local p = menu.page
    local t = menu.target

    if (p == "player" or p == "pfun" or p == "pmgmt") then
        if t == nil or not gNetworkPlayers[t].connected then
            goto_page("players")
            return build_items()
        end
    end

    if p == "main" then
        add(L("m_bring_all"), function() request("bring_all") end)
        add(L("m_players"), function() goto_page("players") end)
        add(L("m_freeze_all"), function() request("freeze_all", nil, true) end)
        add(L("m_unfreeze_all"), function() request("freeze_all", nil, false) end)
        add(L("m_levels"), function() goto_page("levels") end)
        add(L("m_announce"))
        add(L("m_settings"), function() goto_page("settings") end)
        if spectating then add(L("m_stop_spec"), stop_spectate) end
        add(L("m_close"), function() menu.open = false end)

    elseif p == "players" then
        for i = 0, MAX_PLAYERS - 1 do
            if i ~= 0 and gNetworkPlayers[i].connected then
                add(clean(gNetworkPlayers[i].name) .. tags(i), function()
                    menu.target = i
                    goto_page("player")
                end)
            end
        end
        add(L("back"), function() goto_page("main") end)

    elseif p == "player" then
        add(L("p_bring"), function() request("bring", t) end)
        add(L("p_goto"), function()
            local m = gMarioStates[t]
            local np = gNetworkPlayers[t]
            apply_teleport(m.pos.x, m.pos.y, m.pos.z, np.currLevelNum, np.currAreaIndex, np.currActNum)
        end)
        add(L("p_spectate"), function() start_spectate(t) end)
        add(flag("frz", t) == true and L("p_unfreeze") or L("p_freeze"), function() request("freeze", t) end)
        add(flag("mut", t) == true and L("p_unmute") or L("p_mute"), function() request("mute", t) end)
        add(L("p_fun"), function() goto_page("pfun") end)
        add(L("p_mgmt"), function() goto_page("pmgmt") end)
        add(L("back"), function() goto_page("players") end)

    elseif p == "pfun" then
        add(L("f_invis", onoff(flag("inv", t))), function() request("invis", t) end)
        add(L("f_god", onoff(flag("god", t))), function() request("god", t) end)
        add(L("f_boost", flag("spd", t) or 1), function() request("boost", t) end)
        add(L("f_heal"), function() request("heal", t) end)
        add(L("f_kill"), function()
            ask_confirm(L("c_kill"), function() request("kill", t) end, "pfun")
        end)
        add(L("back"), function() goto_page("player") end)

    elseif p == "pmgmt" then
        add(L("g_kick"), function()
            ask_confirm(L("c_kick"), function() request("kick", t) end, "pmgmt")
        end)
        if network_is_server() then
            add(L("g_ban"), function()
                ask_confirm(L("c_ban"), function() request("ban", t) end, "pmgmt")
            end)
            add(flag("adm", t) == true and L("g_mod_off") or L("g_mod_on"), function() request("mod", t) end)
        end
        add(L("back"), function() goto_page("player") end)

    elseif p == "levels" then
        for _, lv in ipairs(LEVELS) do
            add(lang == "tr" and lv[2] or lv[1], function()
                ask_confirm(L("c_warp"), function() request("warp_all", nil, lv[3]) end, "levels")
            end)
        end
        add(L("back"), function() goto_page("main") end)

    elseif p == "settings" then
        add(L("s_lang", L("langname")), function()
            lang = (lang == "en") and "tr" or "en"
        end)
        if network_is_server() then add(L("s_bans"), function() goto_page("bans") end) end
        add(L("s_log"), function() goto_page("log") end)
        add(L("back"), function() goto_page("main") end)

    elseif p == "bans" then
        for _, name in ipairs(load_list("bans")) do
            add(L("unban_item", clean(name)), function()
                ask_confirm(L("c_unban"), function() request("unban", nil, name) end, "bans")
            end)
        end
        add(L("back"), function() goto_page("settings") end)

    elseif p == "log" then
        for k = #logLines, 1, -1 do add(logLines[k]) end
        add(L("back"), function() goto_page("settings") end)

    elseif p == "confirm" then
        local c = menu.confirm
        add(c.label, function()
            c.fn()
            goto_page(c.back)
        end)
        add(L("c_no"), function() goto_page(c.back) end)
    end
    return list
end

local parents = {
    players = "main", player = "players", pfun = "player", pmgmt = "player",
    settings = "main", bans = "settings", log = "settings", levels = "main"
}

local function menu_back()
    if B_CLOSES_ALL then
        menu.open = false
    elseif menu.page == "confirm" and menu.confirm then
        goto_page(menu.confirm.back)
    elseif parents[menu.page] then
        goto_page(parents[menu.page])
    else
        menu.open = false
    end
end

local function open_menu()
    menu.open = true
    goto_page("main")
end

local function clamp_scroll(n)
    if menu.sel < 1 then menu.sel = n end
    if menu.sel > n then menu.sel = 1 end
    if menu.sel < menu.scroll + 1 then menu.scroll = menu.sel - 1 end
    if menu.sel > menu.scroll + VIS then menu.scroll = menu.sel - VIS end
    if menu.scroll < 0 then menu.scroll = 0 end
end

-----------------------------------------------------------
-- Chat commands: /admin panel, /admin announce <msg>, /ap
-----------------------------------------------------------
local function admin_command(text)
    if not can_admin_local() then
        msg(L("noperm"))
        return true
    end
    local cmd, rest = text:match("^(%S*)%s*(.*)$")
    cmd = (cmd or ""):lower()
    if cmd == "" or cmd == "panel" then
        open_menu()
    elseif (cmd == "announce" or cmd == "duyuru") and rest ~= "" then
        request("announce", nil, rest)
    else
        msg(L("usage"))
    end
    return true
end

hook_chat_command("admin", "[panel | announce <message>] - Admin panel", admin_command)
hook_chat_command("ap", "[panel | announce <message>] - Shortcut for /admin", admin_command)

-----------------------------------------------------------
-- Input and freezing (local Mario)
-- NOTE: the game computes "buttonPressed" from the previous frame's buttonDown.
-- Since we zero the controller while the menu is open, the game would think
-- a held button is newly pressed every frame. So we detect presses ourselves.
-----------------------------------------------------------
local function clear_controller(c)
    c.buttonPressed = 0
    c.buttonDown = 0
    c.stickX = 0
    c.stickY = 0
    c.rawStickX = 0
    c.rawStickY = 0
    c.stickMag = 0
end

hook_event(HOOK_BEFORE_MARIO_UPDATE, function(m)
    if m.playerIndex ~= 0 then return end
    local c = m.controller

    -- fresh hardware state (read BEFORE we clear anything)
    local down = c.buttonDown
    local pressed = down & ~prevDown
    prevDown = down

    local dirY = 0
    if c.rawStickY > 40 then dirY = -1 elseif c.rawStickY < -40 then dirY = 1 end
    local dirX = 0
    if c.rawStickX > 40 then dirX = 1 elseif c.rawStickX < -40 then dirX = -1 end

    local captured = (menu.open and can_admin_local()) or spectating ~= nil

    -- Panel just closed: ignore the buttons still held so Mario doesn't jump/punch
    if wasCaptured and not captured then suppress = true end
    wasCaptured = captured
    if suppress then
        if (down & SUPPRESS_MASK) ~= 0 or dirX ~= 0 or dirY ~= 0 then
            prevStickY, prevStickX = dirY, dirX
            clear_controller(c)
            return
        end
        suppress = false
    end

    -- Menu open
    if menu.open and can_admin_local() then
        local items = build_items()
        local up = (pressed & U_JPAD) ~= 0 or (dirY == -1 and prevStickY ~= -1)
        local dn = (pressed & D_JPAD) ~= 0 or (dirY == 1 and prevStickY ~= 1)
        if up then menu.sel = menu.sel - 1 end
        if dn then menu.sel = menu.sel + 1 end
        clamp_scroll(#items)

        if (pressed & A_BUTTON) ~= 0 and items[menu.sel] then
            items[menu.sel].fn()
        elseif (pressed & B_BUTTON) ~= 0 then
            menu_back()
        end
        prevStickY, prevStickX = dirY, dirX
        clear_controller(c)
        return
    end

    -- Spectating: Left/Right = switch player, B = exit
    if spectating ~= nil then
        if (pressed & B_BUTTON) ~= 0 then
            stop_spectate()
        elseif (pressed & R_JPAD) ~= 0 or (dirX == 1 and prevStickX ~= 1) then
            cycle_spectate(1)
        elseif (pressed & L_JPAD) ~= 0 or (dirX == -1 and prevStickX ~= -1) then
            cycle_spectate(-1)
        end
        prevStickY, prevStickX = dirY, dirX
        clear_controller(c)
        m.forwardVel = 0
        return
    end
    prevStickY, prevStickX = dirY, dirX

    -- Frozen player
    if flag("frz", 0) == true and not network_is_server() then
        clear_controller(c)
        m.forwardVel = 0
        m.vel.x = 0
        m.vel.z = 0
    end
end)

-- All Marios: invisibility, godmode, pending teleport, jump boost
hook_event(HOOK_MARIO_UPDATE, function(m)
    local idx = m.playerIndex
    local g = gNetworkPlayers[idx].globalIndex

    -- Invisibility
    local inv = gGlobalSyncTable["inv" .. g] == true
    if m.marioObj ~= nil then
        local node = m.marioObj.header.gfx.node
        if inv then
            node.flags = node.flags | GRAPH_RENDER_INVISIBLE
        elseif wasInvis[idx] then
            node.flags = node.flags & ~GRAPH_RENDER_INVISIBLE
        end
    end
    wasInvis[idx] = inv

    if idx ~= 0 then return end

    -- Godmode
    if gGlobalSyncTable["god" .. g] == true then
        m.health = 0x880
        m.hurtCounter = 0
    end

    -- Jump boost
    local mult = gGlobalSyncTable["spd" .. g] or 1
    local isJump = (m.action == ACT_JUMP or m.action == ACT_DOUBLE_JUMP or m.action == ACT_TRIPLE_JUMP)
    if mult > 1 and isJump then
        if lastBoostAction ~= m.action then
            m.vel.y = m.vel.y * (1 + 0.35 * (mult - 1))
            lastBoostAction = m.action
        end
    else
        lastBoostAction = nil
    end

    -- Pending teleport
    if pending ~= nil then
        pending.timer = pending.timer + 1
        local np = gNetworkPlayers[0]
        if np.currLevelNum == pending.level and np.currAreaIndex == pending.area
            and np.currAreaSyncValid and pending.timer > 15 then
            place_mario(pending.x, pending.y, pending.z)
            pending = nil
        elseif pending.timer > 600 then
            pending = nil
        end
    end
end)

-- Walking speed boost
hook_event(HOOK_BEFORE_PHYS_STEP, function(m)
    if m.playerIndex ~= 0 then return end
    local mult = gGlobalSyncTable["spd" .. gNetworkPlayers[0].globalIndex] or 1
    if mult > 1 and (m.action & ACT_GROUP_MASK) == ACT_GROUP_MOVING then
        m.vel.x = m.vel.x * mult
        m.vel.z = m.vel.z * mult
    end
end)

-- Hide messages from muted players
hook_event(HOOK_ON_CHAT_MESSAGE, function(m, message)
    if gGlobalSyncTable["mut" .. gNetworkPlayers[m.playerIndex].globalIndex] == true then
        return false
    end
end)

-----------------------------------------------------------
-- Host maintenance (ban check, moderator restore, cleanup) + camera + chat hint
-----------------------------------------------------------
hook_event(HOOK_UPDATE, function()
    -- Chat hint right after the game starts (like the Debug Tool message)
    if not hintShown and get_global_timer() > 45 and can_admin_local() then
        hintShown = true
        local h = L("hint")
        h = (h:gsub("%b[]", "\\#ff66ff\\%0\\#ffffff\\"))
        h = (h:gsub("/admin panel", "\\#00ffff\\%0\\#ffffff\\"))
        h = (h:gsub("/ap", "\\#00ffff\\%0\\#ffffff\\"))
        msg(h)
    end

    -- Spectator camera
    if spectating ~= nil then
        if not gNetworkPlayers[spectating].connected then
            stop_spectate()
        else
            local t = gMarioStates[spectating]
            local dist = 650
            local px = t.pos.x - sins(t.faceAngle.y) * dist
            local pz = t.pos.z - coss(t.faceAngle.y) * dist
            local py = t.pos.y + 280
            local l = gLakituState
            l.curPos.x = px; l.curPos.y = py; l.curPos.z = pz
            l.pos.x = px; l.pos.y = py; l.pos.z = pz
            l.goalPos.x = px; l.goalPos.y = py; l.goalPos.z = pz
            l.curFocus.x = t.pos.x; l.curFocus.y = t.pos.y + 120; l.curFocus.z = t.pos.z
            l.focus.x = t.pos.x; l.focus.y = t.pos.y + 120; l.focus.z = t.pos.z
            l.goalFocus.x = t.pos.x; l.goalFocus.y = t.pos.y + 120; l.goalFocus.z = t.pos.z
        end
    end

    if not network_is_server() then return end
    if get_global_timer() % 30 ~= 0 then return end

    local bans = load_list("bans")
    local admins = load_list("admins")
    for i = 1, MAX_PLAYERS - 1 do
        local np = gNetworkPlayers[i]
        if np.connected then
            seenGlobal[i] = np.globalIndex
            if in_list(bans, np.name) then
                if not try_kick(i) and not warnedBan[np.name] then
                    warnedBan[np.name] = true
                    msg(L("ban_join", clean(np.name), clean(np.name)))
                end
            end
            if in_list(admins, np.name) and flag("adm", i) ~= true then
                set_flag("adm", i, true)
            end
        elseif seenGlobal[i] ~= nil then
            -- Clear flags of players who left
            local g = seenGlobal[i]
            for _, prefix in ipairs({ "frz", "mut", "adm", "inv", "god", "spd" }) do
                gGlobalSyncTable[prefix .. g] = nil
            end
            seenGlobal[i] = nil
        end
    end
end)

-----------------------------------------------------------
-- HUD
-----------------------------------------------------------
-- Draws text vertically centered inside a row (fixes the text/highlight offset)
local function text_centered(text, x, rowTop, rowH, scale, r, g, b, a)
    djui_hud_set_color(r, g, b, a)
    djui_hud_print_text(text, x, rowTop + rowH / 2 - FONT_CENTER * scale, scale)
end

-- Horizontally centered box with centered text
local function box_text(text, centerX, top, h, scale, bgAlpha, r, g, b)
    local tw = djui_hud_measure_text(text) * scale
    local bx = centerX - tw / 2 - 8
    djui_hud_set_color(0, 0, 0, bgAlpha)
    djui_hud_render_rect(bx, top, tw + 16, h)
    text_centered(text, bx + 8, top, h, scale, r, g, b, 255)
end

hook_event(HOOK_ON_HUD_RENDER, function()
    djui_hud_set_resolution(RESOLUTION_N64)
    djui_hud_set_font(FONT_NORMAL)
    local sw = djui_hud_get_screen_width()

    -- Announcement
    if announce.timer > 0 then
        announce.timer = announce.timer - 1
        local scale = 0.8
        local tw = djui_hud_measure_text(announce.text) * scale
        local maxw = sw - 50
        if tw > maxw then scale = scale * maxw / tw end
        box_text(announce.text, sw / 2, 60, 26, scale, 170, 255, 220, 0)
    end

    -- Frozen notice
    if flag("frz", 0) == true and not network_is_server() then
        box_text(L("h_frozen"), sw / 2, 20, 18, 0.6, 150, 120, 200, 255)
    end

    -- Muted notice
    if flag("mut", 0) == true then
        text_centered(L("h_muted"), 8, 6, 12, 0.5, 255, 120, 120, 255)
    end

    -- Spectate info
    if spectating ~= nil and gNetworkPlayers[spectating].connected and not menu.open then
        local np = gNetworkPlayers[spectating]
        local m = gMarioStates[spectating]
        local ok, lvl = pcall(get_level_name, np.currCourseNum, np.currLevelNum, np.currAreaIndex)
        if not ok or lvl == nil then lvl = "Level " .. np.currLevelNum end
        local diff = (np.currLevelNum ~= gNetworkPlayers[0].currLevelNum)
        local bx = sw / 2 - 130
        djui_hud_set_color(0, 0, 0, 160)
        djui_hud_render_rect(bx, 8, 260, 37)
        text_centered(L("h_watching", clean(np.name), math.max(0, m.health >> 8)), bx + 8, 9, 12, 0.5, 255, 255, 255, 255)
        text_centered(lvl .. (diff and L("h_difflevel") or ""), bx + 8, 21, 11, 0.45, 200, 200, 200, 255)
        text_centered(L("h_spec_help"), bx + 8, 32, 11, 0.4, 180, 180, 255, 255)
    end

    -- Menu
    if not (menu.open and can_admin_local()) then return end

    local items = build_items()
    clamp_scroll(#items)

    local shown = math.min(#items, VIS)
    local textScale = 0.5

    local widest = 0
    for _, it in ipairs(items) do
        widest = math.max(widest, djui_hud_measure_text("> " .. it.label) * textScale)
    end
    widest = math.max(widest, djui_hud_measure_text(L("foot")) * 0.4)

    local titleH = 22
    local footH = 13
    local w = math.max(250, widest + 28)
    local h = titleH + shown * ROW + footH + 4
    local x = sw / 2 - w / 2
    local y = 12

    -- Panel background
    djui_hud_set_color(0, 0, 0, 195)
    djui_hud_render_rect(x, y, w, h)

    -- Title and counter
    text_centered(L("title"), x + 8, y, titleH, 0.7, 255, 200, 0, 255)
    local counter = menu.sel .. "/" .. #items
    local cw = djui_hud_measure_text(counter) * 0.45
    text_centered(counter, x + w - 8 - cw, y, titleH, 0.45, 160, 160, 160, 255)

    -- Rows: highlight and text share the exact same row box
    for k = 1, shown do
        local idx = menu.scroll + k
        local item = items[idx]
        if item then
            local iy = y + titleH + (k - 1) * ROW
            if idx == menu.sel then
                djui_hud_set_color(255, 255, 255, 45)
                djui_hud_render_rect(x + 3, iy, w - 6, ROW)
                text_centered("> " .. item.label, x + 8, iy, ROW, textScale, 255, 255, 0, 255)
            else
                text_centered("  " .. item.label, x + 8, iy, ROW, textScale, 255, 255, 255, 255)
            end
        end
    end

    -- Footer (controls)
    text_centered(L("foot"), x + 8, y + titleH + shown * ROW + 4, footH, 0.4, 160, 160, 160, 255)
end)