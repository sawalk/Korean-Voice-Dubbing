KoreanVoiceDubbing = RegisterMod("Korean Voice Dubbing", 1)
local VoiceSFX = SFXManager()

local function onRender()
  for i = 598, 601 do
    if VoiceSFX:IsPlaying(i) then
      VoiceSFX:Stop(i)
      VoiceSFX:Play(Isaac.GetSoundIdByName("DADS_NOTE_KOREAN_" .. (i - 597)))
    end
  end
end

KoreanVoiceDubbing:AddCallback(ModCallbacks.MC_POST_RENDER, onRender)