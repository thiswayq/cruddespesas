json.id @despesa.id
json.data @despesa.data
json.time @despesa.time.strftime("%H:%M")
json.description @despesa.description
json.amount @despesa.amount
json.comment @despesa.comment