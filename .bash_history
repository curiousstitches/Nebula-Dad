r
nebula-release
nebula-release.zip
exit
git config --global user.email "thegoodguy421@gmail.com"
git config --global user.name "curiousstitches"
pkg install git
y
git add .
git commit -m "Initial release v2.3"
git push -u origin main
pkg install git
git add .
git commit -m "Initial release v2.3"
git push -u origin main
git init
git config --global user.email "thegoodguy421@gmail.com"
git config --global user.name "curiousstitches"
git add .
git commit -m "Initial release v2.3"
git branch -M main
git remote add origin https://github.com/curiousstitches/Nebula-V3.git
git push -u origin mainthegoodguy421@gmail.com
user.email
cd nebula-release
is
cd nebula-release
git remote set-url origin https://github.com/curiousstitches/Nebula-V3.git
git push -u origin main
git push -u https://github.com/curiousstitches/Nebula-V3.git main --force
git push -u https://github.com/curiousstitches/nebula.release.git main --force
cd ~/Downloads/nebula-release/nebula/release
git push -u https://github.com/curiousstitches/Nebula-V3.git main --force
cd ~/Downloads/nebula-release/nebula/release
git push -u https://github.com/curiousstitches/Nebula-V3.git main --force
~ $ git push -u origin main
Username for 'https://github.com': curiousstitches
Password for 'https://curiousstitches@github.com':
To https://github.com/curiousstitches/Nebula-V3.git
error: failed to push some refs to 'https://github.com/curiousstitches/Nebula-V3.git'
hint: Updates were rejected because the remote contains work that you do not
hint: have locally. This is usually caused by another repository pushing to
hint: the same ref. If you want to integrate the remote changes, use
hint: 'git pull' before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
~ $cd ~/Downloads/nebula-release/nebula/release
git push -u https://github.com/curiousstitches/Nebula-V3.git main --forcecd ~/Downloads/nebula-release
git push -u https://github.com/curiousstitches/Nebula-V3.git main --force
cd ~/Downloads/nebula-release/nebula-release
git init
git add .
git commit -m "Nebula V3 initial upload"
git push -u https://github.com/curiousstitches/Nebula-V3.git main --force
is
pkg install unzip
cd ~/storage/downloads
unzip nebula-release.zip
cd nebula-release
termux-setup-storage
ls ~/storage/
ls ~/storage/downloads/
cd ~/storage/downloads
unzip nebula-release.zip
cd nebula-release
git init
git config --global user.email "thegoodguy421@gmail.com"
git config --global user.name "curiousstitches"
git add .
git commit -m "Initial release v2.3"
git branch -M main
git remote add origin https://github.com/curiousstitches/Nebula-V3.git
git push -u origin main
exit
pkg update -y && pkg install -y git gh openssh unzip
termux-setup-storage
cd ~ && rm -rf Infiniteworlds && unzip -q ~/storage/downloads/Infiniteworlds.zip -d ~/ && cd Infiniteworlds && chmod +x fresh-upload.sh
./fresh-upload.sh
npm install --prefix server && npm install --prefix client && cp .env.example .env
node server/index.js &           # backend
npm run dev --prefix client      # frontend → http://localhost:5173pkg install nodejs
npm install --prefix server && npm install --prefix client && cp .env.example .env
node server/index.js &           # backend
npm run dev --prefix client      # frontend → http://localhost:5173pkg install nodejs-lts
pkg install -y nodejs-lts python make clang && node -v && npm -v
cd ~/Infiniteworlds && npm install --prefix server && npm install --prefix client && cp .env.example .env
exit
cd ~/Infiniteworlds/server && npm uninstall better-sqlite3 && npm install node-sqlite3-wasm && cd ..
cd ~/Infiniteworlds && npm uninstall elevenlabs --prefix server && npm install @elevenlabs/elevenlabs-js --prefix server
cat > ~/Infiniteworlds/server/services/elevenlabs.js << 'EOF'
import { ElevenLabsClient } from '@elevenlabs/elevenlabs-js';

const el = new ElevenLabsClient({ apiKey: process.env.ELEVENLABS_API_KEY });

export const VOICE_PRESETS = {
  mystical_female:  'EXAVITQu4vr4xnSDxMaL',
  deep_male:        'VR6AewLTigWG4xSOukaG',
  playful_creature: 'yoZ06aMxZJJ28mfd3POQ',
  ancient_beast:    'pNInz6obpgDQGcFmaJgB',
  ethereal_spirit:  'jBpfuIE2acCO8z3wKNLl',
  gruff_warrior:    'g5CIjZEefAph4nQFvHAz',
  wise_elder:       'onwK4e9ZLuTAKqWW03F9',
};

export const EMOTION_TO_SETTINGS = {
  amused:     { stability: 0.35, similarity_boost: 0.85, style: 0.7, speaking_rate: 1.1  },
  nervous:    { stability: 0.25, similarity_boost: 0.75, style: 0.6, speaking_rate: 1.25 },
  excited:    { stability: 0.20, similarity_boost: 0.80, style: 0.9, speaking_rate: 1.3  },
  whisper:    { stability: 0.90, similarity_boost: 0.95, style: 0.1, speaking_rate: 0.8  },
  somber:     { stability: 0.70, similarity_boost: 0.90, style: 0.3, speaking_rate: 0.85 },
  mysterious: { stability: 0.55, similarity_boost: 0.85, style: 0.5, speaking_rate: 0.9  },
  playful:    { stability: 0.30, similarity_boost: 0.80, style: 0.8, speaking_rate: 1.15 },
  fearful:    { stability: 0.15, similarity_boost: 0.70, style: 0.7, speaking_rate: 1.4  },
  neutral:    { stability: 0.50, similarity_boost: 0.85, style: 0.4, speaking_rate: 1.0  },
};

const streamArgs = (text, s) => ({
  text,
  modelId: 'eleven_turbo_v2_5',
  voiceSettings: {
    stability:        s.stability,
    similarityBoost:  s.similarity_boost,
    style:            s.style,
    useSpeakerBoost:  true,
  },
  outputFormat: 'mp3_44100_128',
});

export const synthesizeSpeech = async (text, voiceId, emotion = 'neutral') => {
  const s = EMOTION_TO_SETTINGS[emotion] || EMOTION_TO_SETTINGS.neutral;
  const audioStream = await el.textToSpeech.stream(voiceId, streamArgs(text, s));
  const chunks = [];
  for await (const chunk of audioStream) chunks.push(chunk);
  return Buffer.concat(chunks);
};

export const streamSpeechToResponse = async (text, voiceId, emotion, res) => {
  const s = EMOTION_TO_SETTINGS[emotion] || EMOTION_TO_SETTINGS.neutral;
  res.setHeader('Content-Type', 'audio/mpeg');
  res.setHeader('Transfer-Encoding', 'chunked');
  const audioStream = await el.textToSpeech.stream(voiceId, streamArgs(text, s));
  for await (const chunk of audioStream) res.write(chunk);
  res.end();
};

export default el;
EOF

cd ~/Infiniteworlds && node server/index.js
exit
