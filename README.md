#React Native Document Interaction Controller

This package calls UIDocumentInteractionController for IOS to preview document.

```
import DocumentInteractionController from 'react-native-document-interaction-controller';

DocumentInteractionController.preview(localFilePath);
```

To preview a remote file, download with `react-native-fs`.