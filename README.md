# GCP Github Action

This action creates a simple interface for GCloud CLI tool. It takes a raw commands.

```
- uses: convictional/gcp-storage-action@master
  with:
  application_credentials: ${{ secrets.GCP_AUTH }}
  project_id: myproject_on_gcp
  command: gcloud app deploy api.yaml --stop-previous-version
```

Another option:

```
- uses: convictional/gcp-storage-action@master
  with:
  application_credentials: ${{ secrets.GCP_AUTH }}
  project_id: myproject_on_gcp
  commands: "gcloud app deploy api.yaml --stop-previous-version|gcloud app deploy another.yaml --stop-previous-version"
```

Or both:

```
- uses: convictional/gcp-storage-action@master
  with:
  application_credentials: ${{ secrets.GCP_AUTH }}
  project_id: myproject_on_gcp
  command: echo "All done"
  commands: gcloud app deploy api.yaml --stop-previous-version|gcloud app deploy another.yaml --stop-previous-version
```
