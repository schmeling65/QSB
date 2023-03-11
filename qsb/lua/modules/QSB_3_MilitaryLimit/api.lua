--[[
Copyright (C) 2021 - 2022 totalwarANGEL - All Rights Reserved.

This file is part of the QSB-R. QSB-R is created by totalwarANGEL.
This File was modified by Jelumar.
You may use and modify this file unter the terms of the MIT licence.
(See https://en.wikipedia.org/wiki/MIT_License)
]]

---
-- Dieses Modul ermöglicht es das Soldatenlimit eines Spielers frei festzulegen.
--
-- <b>Hinweis</b>: Wird nichts eingestellt, wird der Standard verwendet. Das
-- Limit ist dann 25, 43, 61, 91 (je nach Ausbaustufe der Burg).
--
-- <b>Vorausgesetzte Module:</b>
-- <ul>
-- <li><a href="Swift_1_EntityEventCore.api.html">(1) Entity Event Core</a></li>
-- <li><a href="Swift_1_InterfaceCore.api.html">(1) Interface Core</a></li>
-- <li><a href="Swift_1_JobsCore.api.html">(1) Jobs Core</a></li>
-- </ul>
--
-- @within Beschreibung
-- @set sort=true
--

---
-- Events, auf die reagiert werden kann.
--
-- @field ProducedThief     Ein Dieb wird rekrutiert (Parameter: EntityID, CastleID, CostsTable)
-- @field ProducedBattalion Ein Battalion wird rekrutiert (Parameter: EntityID, BarrackID, CostsTable)
-- @field RefilledBattalion Ein Battalion wird aufgefüllt (Parameter: EntityID, BarrackID, SoldiersBefore, SoldiersAfter, CostsTable)
--
-- @within Event
--
QSB.ScriptEvents = QSB.ScriptEvents or {}

---
-- Gibt das aktuelle Soldatenlimit des Spielers zurück.
--
-- @param[type=number] _PlayerID ID des Spielers
-- @return[type=number] Aktuelles Soldatenlimit
-- @within Anwenderfunktionen
-- @usage local Limit = API.GetPlayerSoldierLimit(1);
--
function API.GetPlayerSoldierLimit(_PlayerID)
    return ModuleMilitaryLimit.Shared:GetLimitForPlayer(_PlayerID);
end

---
-- Setzt die Funktion zur Berechnung des Soldatenlimit.
--
-- Wird die Funktion nil gesetzt, wird der Standard in Abhängigkeit der
-- Burgausbaustufe verwendet.
--
-- @param[type=number]   _PlayerID ID des Spielers
-- @param[type=function] _Function (Optional) Funktion zur Ermittlung
-- @within Anwenderfunktionen
-- -- Verwende den Standard (25, 43, 61, 91)
-- @usage API.SetPlayerSoldierLimit(1);
-- -- Verwende eigene Funktion (Limit ist für den Spieler immer 2000)
-- @usage API.SetPlayerSoldierLimit(1, function(_PlayerID)
--     return 2000;
-- end);
--
function API.SetPlayerSoldierLimit(_PlayerID, _Function)
    if GUI then
        return;
    end
    ModuleMilitaryLimit.Global:SetLimitsForPlayer(_PlayerID, _Function);
end