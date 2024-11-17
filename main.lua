KoreanVoiceDubbing = RegisterMod("Korean Voice Dubbing", 1)
local VoiceSFX = SFXManager()

local font = Font()
font:Load("font/cjk/lanapixel.fnt")

local showMessage3
if KoreanLocalizingPlus then
  showMessage3 = false
else
  showMessage3 = true
end
local messageTime3 = 150
local messageDisplayedTime3 = 0

local function updateMessage3()
  if showMessage3 then
    messageDisplayedTime3 = messageDisplayedTime3 + 1
    if messageDisplayedTime3 >= messageTime3 then
      showMessage3 = false
    end
  end
end

local function renderMessage3()
  local renderMessageWidth
  if KoreanLocalizingPlus and showMessage3 then
    if Options.MaxScale == 3 and Options.Fullscreen == true then
      renderMessageWidth = 0.66666
      renderMessageY = 242
      renderMessageY3 = 254
    else
      renderMessageWidth = 0.5
      renderMessageY = 240
      renderMessageY3 = 250
    end
    font:DrawStringScaledUTF8("보스명 교체에 대한 2차 설문이 진행 중입니다! https://gall.dcinside.com/m/tboi/129340",10,renderMessageY,renderMessageWidth,renderMessageWidth,KColor(1,1,1,1),0,true)
    font:DrawStringScaledUTF8("이 메시지는 11월 25일까지 게임 시작 후 3초간 표시됩니다.",10,renderMessageY3,renderMessageWidth,renderMessageWidth,KColor(1,1,1,1),0,true)
  end
end

local function onRender()
  for i = 598, 601 do
    if VoiceSFX:IsPlaying(i) then
      VoiceSFX:Stop(i)
      VoiceSFX:Play(Isaac.GetSoundIdByName("DADS_NOTE_KOREAN_" .. (i - 597)))
    end
  end
end

KoreanVoiceDubbing:AddCallback(ModCallbacks.MC_POST_UPDATE, updateMessage3)
KoreanVoiceDubbing:AddCallback(ModCallbacks.MC_POST_RENDER, renderMessage3)
KoreanVoiceDubbing:AddCallback(ModCallbacks.MC_POST_RENDER, onRender)