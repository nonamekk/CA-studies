<a href="../../README.md">
<img src="../../.readme/assets/codeacademy-black.svg" height="42">
</a>

## MacOS Tips'n'Tricks

### Finding the ` and ~
In order to change the MacOS UK defaults § and ± run script from the 
terminal:
```
hidutil property --set 
'{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035},{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064}]}'
``` 
