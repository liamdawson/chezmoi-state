function switch-audio-devices -d "Switch audio devices"
  set -f ordered_inputs (yq '(.inputs[] | to_entries)[] | .value' ~/.config/ldaws/audio-device-priorities.yaml)
  set -f ordered_input_names (yq '(.inputs[] | to_entries)[] | .key' ~/.config/ldaws/audio-device-priorities.yaml)
  set -f ordered_outputs (yq '(.outputs[] | to_entries)[] | .value' ~/.config/ldaws/audio-device-priorities.yaml)
  set -f ordered_output_names (yq '(.outputs[] | to_entries)[] | .key' ~/.config/ldaws/audio-device-priorities.yaml)

  for device in $ordered_inputs
    if SwitchAudioSource -t input -u "$device" >/dev/null 2>&1
      echo "Set input to $ordered_input_names[1]."; and break
    end

    set -e ordered_input_names[1]
  end
  
  for device in $ordered_outputs
    if SwitchAudioSource -t output -u "$device" >/dev/null 2>&1
      echo "Set output to $ordered_output_names[1]."; and break
    end

    set -e ordered_output_names[1]
  end
end
