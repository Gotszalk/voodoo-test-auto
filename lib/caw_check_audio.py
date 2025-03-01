from pycaw.pycaw import AudioUtilities, IAudioMeterInformation
from comtypes import CLSCTX_ALL

def _get_playing_sessions():
    # List of sessions with audio
    audio_sessions = []
    
    # Get all audio sessions
    sessions = AudioUtilities.GetAllSessions()

    for session in sessions:
        if session.Process:  # Check if the session has an associated process
            process_name = session.Process.name()
            try:
                # Get the audio meter information interface
                audio_meter = session._ctl.QueryInterface(IAudioMeterInformation)
                
                # Check the peak audio level (0.0 = silence, >0.0 = audio activity)
                peak_value = audio_meter.GetPeakValue()
                
                if peak_value > 0:
                    # session plays audio -> add to list
                    audio_sessions.append(str(session))

            except Exception as e:
                print(f"Could not retrieve audio information for {process_name}: {e}")
    return audio_sessions

def playing_sessions():
	return _get_playing_sessions()

def is_playing(session):
    # print(session)
    audio_sessions = _get_playing_sessions()
    filtered_sessions = [item for item in audio_sessions if session in item]
    # print(filtered_sessions)
    if filtered_sessions:
        result = True
    else:
        result = False
    return result