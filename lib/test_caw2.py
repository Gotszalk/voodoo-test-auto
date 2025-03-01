from caw_check_audio import is_playing, playing_sessions

sessions = playing_sessions()

if not sessions:
    print('No session is playing audio')
else:
    for session in sessions:
        print(f'Playing {session}\n')
    
print('----------------------------------------------')
print('Firefox ')
if is_playing('Firefox'):
    print('is playing audio')
else:
    print('is NOT playing audio')
    